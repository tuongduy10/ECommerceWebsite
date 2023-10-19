﻿using ECommerce.Application.Common;
using ECommerce.Application.Enums;
using ECommerce.Application.Repositories;
using ECommerce.Application.Services.Inventory;
using ECommerce.Application.Services.Inventory.Dtos;
using ECommerce.Application.Services.Product.Dtos;
using ECommerce.Data.Context;
using ECommerce.Data.Models;
using Microsoft.EntityFrameworkCore;
using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ECommerce.Application.Services.Product
{
    public class ProductService : IProductService
    {
        private readonly ECommerceContext _DbContext;
        private readonly IRepositoryBase<Data.Models.Product> _productRepo;
        private readonly IRepositoryBase<Option> _optionRepo;
        private readonly IRepositoryBase<OptionValue> _optionValueRepo;
        private readonly IRepositoryBase<Brand> _brandRepo;
        private readonly IRepositoryBase<BrandCategory> _brandCategoryRepo;
        private readonly IRepositoryBase<SubCategory> _subCategoryRepo;
        private readonly IRepositoryBase<SubCategoryOption> _subCategoryOptionRepo;
        private readonly IRepositoryBase<ProductOptionValue> _productOptionValueRepo;
        private readonly IRepositoryBase<Shop> _shopRepo;
        private readonly IRepositoryBase<ProductImage> _productImageRepo;
        private readonly IRepositoryBase<ProductUserImage> _productUserImageRepo;
        private readonly IRepositoryBase<ProductAttribute> _productAttributeRepo;
        private readonly IRepositoryBase<Rate> _rateRepo;
        private readonly IRepositoryBase<Discount> _discountRepo;
        private readonly IInventoryService _inventoryService;
        public ProductService(ECommerceContext DbContext, IInventoryService inventoryService)
        {
            _DbContext = DbContext;
            _inventoryService = inventoryService;
            if (_productRepo == null)
                _productRepo = new RepositoryBase<Data.Models.Product>(_DbContext);
            if (_brandCategoryRepo == null)
                _brandCategoryRepo = new RepositoryBase<BrandCategory>(_DbContext);
            if (_subCategoryRepo == null)
                _subCategoryRepo = new RepositoryBase<SubCategory>(_DbContext);
            if (_optionRepo == null)
                _optionRepo = new RepositoryBase<Option>(_DbContext);
            if (_optionValueRepo == null)
                _optionValueRepo = new RepositoryBase<OptionValue>(_DbContext);
            if (_subCategoryOptionRepo == null)
                _subCategoryOptionRepo = new RepositoryBase<SubCategoryOption>(_DbContext);
            if (_productOptionValueRepo == null)
                _productOptionValueRepo = new RepositoryBase<ProductOptionValue>(_DbContext);
            if (_productImageRepo == null)
                _productImageRepo = new RepositoryBase<ProductImage>(_DbContext);
            if (_productUserImageRepo == null)
                _productUserImageRepo = new RepositoryBase<ProductUserImage>(_DbContext);
            if (_brandRepo == null)
                _brandRepo = new RepositoryBase<Brand>(_DbContext);
            if (_shopRepo == null)
                _shopRepo = new RepositoryBase<Shop>(_DbContext);
            if (_productAttributeRepo == null)
                _productAttributeRepo = new RepositoryBase<ProductAttribute>(_DbContext);
            if (_rateRepo == null)
                _rateRepo = new RepositoryBase<Rate>(_DbContext);
            if (_discountRepo == null)
                _discountRepo = new RepositoryBase<Discount>(_DbContext);
        }
        public async Task<Response<ProductModel>> getProductDetail(int id)
        {
            try
            {
                var rates = _rateRepo.Entity()
                    .Where(i => i.ProductId == id)
                    .Select(i => new RateModel
                    {
                        id = i.RateId,
                        value = i.RateValue,
                        comment = i.Comment,
                        htmlPosition = i.HtmlPosition,
                        repliedId = i.RepliedId,
                        parentId = i.ParentId,
                        productId = i.ProductId,
                        idsToDelete = i.IdsToDelete,

                        userId = i.UserId,
                        userRepliedId = i.UserRepliedId,
                        createDate = i.CreateDate,
                    })
                    .ToList();
                var options = _optionRepo.Entity()
                    .Where(opt => _productOptionValueRepo.Entity()
                        .Any(pov => pov.ProductId == id && pov.OptionValue.OptionId == opt.OptionId))
                    .Select(opt => new OptionModel
                    {
                        id = opt.OptionId,
                        name = opt.OptionName,
                        values = _productOptionValueRepo.Entity()
                            .Where(pov =>
                                pov.ProductId == id && pov.OptionValue.OptionId == opt.OptionId)
                            .Select(pov => new OptionValueModel
                            {
                                id = pov.OptionValue.OptionValueId,
                                name = pov.OptionValue.OptionValueName,
                            })
                            .ToList()
                    })
                    .ToList();
                var attributes = _productAttributeRepo.Entity()
                    .Where(i => i.ProductId == id)
                    .Select(i => new AttributeModel
                    {
                        id = i.AttributeId,
                        value = i.Value,
                        name = i.Attribute.AttributeName,
                    })
                    .ToList();
                var imagePaths = _productImageRepo.Entity()
                    .Where(img => img.ProductId == id)
                    .Select(i => i.ProductImagePath)
                    .ToList();
                var userImagePaths = _productUserImageRepo.Entity()
                    .Where(img => img.ProductId == id)
                    .Select(i => i.ProductUserImagePath)
                    .ToList();
                var review = new ReviewModel
                {
                    avgValue = rates.Count() > 0 ? (int)Math.Round((double)(rates.Sum(i => i.value) / rates.Count)) : 0,
                    totalRating = rates.Count() > 0 ? rates.Count() : 0,
                    rates = rates
                };

                var product = await _productRepo.Entity()
                    .Where(i => i.ProductId == id)
                    .Select(i => new ProductModel
                    {
                        id = i.ProductId,
                        code = i.ProductCode,
                        ppc = i.Ppc,
                        name = i.ProductName,
                        description = i.ProductDescription,
                        size = i.SizeGuide,

                        delivery = i.Delivery,
                        repay = i.Repay,
                        insurance = i.Insurance,
                        isLegit = i.Legit,

                        brand = new BrandModel
                        {
                            id = i.BrandId,
                            name = i.Brand.BrandName,
                            description = i.Brand.Description,
                            descriptionTitle = i.Brand.DescriptionTitle,
                            imagePath = i.Brand.BrandImagePath,
                        },
                        shop = new ShopModel
                        {
                            id = i.ShopId,
                            name = i.Shop.ShopName,
                        },
                        attributes = attributes,
                        options = options,
                        importDate = i.ProductImportDate,

                        priceAvailable = i.PriceAvailable,
                        pricePreOrder = i.PricePreOrder,
                        discountAvailable = i.DiscountAvailable,
                        discountPreOrder = i.DiscountPreOrder,

                        imagePaths = imagePaths,
                        userImagePaths = userImagePaths,

                        review = review
                    })
                    .FirstOrDefaultAsync();

                return new SuccessResponse<ProductModel>(product);
            }
            catch (Exception error)
            {
                return new FailResponse<ProductModel>(error.Message);
            }
        }
        public async Task<Response<PageResult<ProductModel>>> getProductList(ProductGetRequest request)
        {
            try
            {
                //Request parameters
                int id = request.id ?? -1;
                int brandId = request.brandId;
                int subCategoryId = request.subCategoryId;
                int pageindex = request.PageIndex;
                int pagesize = request.PageSize;
                string orderBy = request.orderBy;
                List<int> listOptionValueId = request.optionValueIds;

                var proIdsByOption = _productOptionValueRepo.Entity()
                    .Where(i => listOptionValueId != null && listOptionValueId.Contains(i.OptionValueId))
                    .Select(i => i.ProductId)
                    .Distinct()
                    .ToList();

                var query = _productRepo.Entity()
                    .Join(_brandRepo.Entity(),
                        product => product.BrandId,
                        brand => brand.BrandId,
                        (product, brand) => new { product, brand })
                    .Join(_shopRepo.Entity(),
                        combined => combined.product.ShopId,
                        shop => shop.ShopId,
                        (combined, shop) => new { combined.product, combined.brand, shop })
                    .Where(combined => 
                        combined.product.BrandId == brandId &&
                        combined.product.Status == (int)ProductStatusEnum.Available)
                    .Select(combined => new { combined.product, combined.brand, combined.shop })
                    .Where(q =>
                        (proIdsByOption != null && proIdsByOption.Contains(q.product.ProductId)) ||
                        (brandId > -1 && q.product.BrandId == brandId) ||
                        (subCategoryId > -1 && q.product.SubCategoryId == subCategoryId) ||
                        (orderBy == "newest" ? q.product.New == true : q.product.New == false) ||
                        (orderBy == "discount" ? q.product.DiscountPercent > 0 : q.product.DiscountPercent > -1))
                    .OrderBy(combined => combined.product.SubCategoryId);

                var list = query
                    .Select(i => new ProductModel()
                    {
                        id = i.product.ProductId,
                        name = i.product.ProductName,
                        discountPercent = i.product.DiscountPercent,
                        status = i.product.Status,
                        isHighlights = i.product.Highlights,
                        isNew = i.product.New,
                        createdDate = i.product.ProductAddedDate,
                        importDate = i.product.ProductImportDate,
                        subCategoryId = i.product.SubCategoryId,

                        priceAvailable = i.product.PriceAvailable,
                        pricePreOrder = i.product.PricePreOrder,
                        discountAvailable = i.product.DiscountAvailable,
                        discountPreOrder = i.product.DiscountPreOrder,

                        imagePaths = _productImageRepo.Entity()
                            .Where(img => img.ProductId == i.product.ProductId)
                            .Select(i => i.ProductImagePath)
                            .ToList(),
                        brand = new BrandModel
                        {
                            id = i.product.BrandId,
                            name = i.product.Brand.BrandName,
                            description = i.product.Brand.Description,
                            descriptionTitle = i.product.Brand.DescriptionTitle,
                            imagePath = i.product.Brand.BrandImagePath,
                        },
                    });

                if (orderBy == "asc")
                {
                    list = list.OrderBy(i => i.discountPreOrder ?? i.discountAvailable ?? i.pricePreOrder ?? i.priceAvailable);
                }
                else if (orderBy == "desc")
                {
                    list = list.OrderByDescending(i => i.discountPreOrder ?? i.discountAvailable ?? i.pricePreOrder ?? i.priceAvailable);
                } 
                else
                {
                    list = list.OrderByDescending(i => i.createdDate);
                }

                var record = await list.CountAsync();
                var data = await PaginatedList<ProductModel>.CreateAsync(list, pageindex, pagesize);
                var result = new PageResult<ProductModel>()
                {
                    Items = data,
                    CurrentRecord = (pageindex * pagesize) <= record ? (pageindex * pagesize) : record,
                    TotalRecord = record,
                    CurrentPage = pageindex,
                    TotalPage = (int)Math.Ceiling(record / (double)pagesize)
                };

                return new SuccessResponse<PageResult<ProductModel>>(result);
            }
            catch (Exception error)
            {
                return new FailResponse<PageResult<ProductModel>>(error.Message);
            }
        }
        public async Task<Response<List<ProductModel>>> getManagedProductList(ProductGetRequest request)
        {
            try
            {
                int id = (int)request.id;
                int subCategoryId = request.subCategoryId;

                var query = from products in _DbContext.Products
                            select products;
                if (subCategoryId != 0)
                    query = query.Where(i => i.SubCategoryId == subCategoryId);
                
                var result = await query
                    .Where(q => id > -1 ? q.ProductId == id : q.ProductId > -1)
                    .Select(i => new ProductModel()
                    {
                        id = i.ProductId,
                        name = i.ProductName,
                        ppc = i.Ppc,
                        code = i.ProductCode,
                        createdDate = i.ProductAddedDate,
                        status = i.Status,
                        stock = (int)i.ProductStock,
                        subCategoryName = i.SubCategory.SubCategoryName,
                        categoryName = i.SubCategory.Category.CategoryName,
                        brand = new BrandModel
                        {
                            id = i.Brand.BrandId,
                            name = i.Brand.BrandName,
                        },
                        imagePaths = i.ProductImages
                            .Select(i => i.ProductImagePath)
                            .ToList(),

                        priceAvailable = i.PriceAvailable,
                        pricePreOrder = i.PricePreOrder,
                        discountAvailable = i.DiscountAvailable,
                        discountPreOrder = i.DiscountPreOrder,
                        priceImport = i.PriceImport,
                        priceForSeller = i.PriceForSeller,

                        profitAvailable = i.ProfitAvailable,
                        profitPreOrder = i.ProfitPreOrder,
                        profitForSeller = i.ProfitForSeller,

                        shop = new ShopModel
                        {
                            id = i.ShopId,
                            name = i.Shop.ShopName,
                        },
                        note = i.Note,
                        link = i.Link
                    })
                    .OrderByDescending(i => i.id)
                    .ToListAsync();

                return new SuccessResponse<List<ProductModel>>(result);
            }
            catch (Exception error)
            {
                return new FailResponse<List<ProductModel>>(error.Message);
            }
        }
        public async Task<Response<bool>> save(ProductSaveRequest request) // add or update
        {
            try
            {
                if (string.IsNullOrEmpty(request.name))
                    return new FailResponse<bool>("Vui lòng nhập tên sản phẩm");
                if (request.shop.id == 0)
                    return new FailResponse<bool>("Vui lòng chọn cửa hàng");
                if (request.brand.id == 0)
                    return new FailResponse<bool>("Vui lòng chọn thương hiệu");
                if (request.subCategoryId == 0)
                    return new FailResponse<bool>("Vui lòng chọn loại sản phẩm");
                // price
                if (request.priceAvailable == null && request.discountAvailable == null && request.pricePreOrder == null && request.discountPreOrder == null)
                    return new FailResponse<bool>("Vui lòng nhập giá sản phẩm");
                if (request.priceAvailable == null && request.discountAvailable != null)
                    return new FailResponse<bool>("Vui lòng nhập giá gốc trước khi nhập giảm giá !");
                if (request.priceAvailable < request.discountAvailable)
                    return new FailResponse<bool>("Giá giảm không thể lớn hơn giá gốc !");
                if (request.pricePreOrder == null && request.discountPreOrder != null)
                    return new FailResponse<bool>("Vui lòng nhập giá gốc trước khi nhập giảm giá !");
                if (request.pricePreOrder < request.discountPreOrder)
                    return new FailResponse<bool>("Giá giảm không thể lớn hơn giá gốc !");
                
                var hasCode = await _productRepo.Entity()
                    .Where(i => request.code != null && i.ProductCode == request.code.Trim())
                    .AnyAsync();
                if (hasCode)
                    return new FailResponse<bool>("Mã này đã tồn tại !");

                var isAdmin = true;
                /*
                 * None relationship data
                 */
                var product = new Data.Models.Product
                {
                    ProductCode = request.code.Trim(),
                    ProductName = request.name.Trim(), // required
                    Ppc = await getNewPPC(),
                    ProductDescription = request.description ?? null,
                    SizeGuide = request.size ?? null,
                    Note = string.IsNullOrEmpty(request.note) ? "" : request.note.Trim(),
                    Link = string.IsNullOrEmpty(request.link) ? "" : request.link.Trim(),
                    DiscountPercent = request.discountPercent ?? null,
                    Legit = request.isLegit,
                    Highlights = request.isHighlights,
                    Delivery = !string.IsNullOrEmpty(request.delivery) ? request.delivery.Trim() : null,
                    ProductStock = request.stock,
                    Repay = !string.IsNullOrEmpty(request.repay) ? request.repay.Trim() : null,
                    Insurance = string.IsNullOrEmpty(request.insurance) ? "" : request.insurance.Trim(),
                    New = request.isNew,
                    ShopId = (int)request.shop.id,
                    BrandId = (int)request.brand.id,
                    ProductAddedDate = DateTime.Now, // default
                    SubCategoryId = request.subCategoryId,
                    Status = isAdmin ? (byte?)ProductStatusEnum.Available : (byte?)ProductStatusEnum.Pending,

                    //Price
                    PriceAvailable = request.priceAvailable ?? null,
                    PricePreOrder = request.pricePreOrder ?? null,
                    PriceForSeller = request.priceForSeller ?? null,
                    PriceImport = request.priceImport ?? null,
                    DiscountAvailable = request.discountPercent != null
                                        ? getDiscountPrice(request.priceAvailable, request.discountPercent)
                                        : (request.discountAvailable ?? null),
                    DiscountPreOrder = request.discountPercent != null
                                        ? getDiscountPrice(request.pricePreOrder, request.discountPercent)
                                        : (request.discountPreOrder ?? null),
                    ProfitForSeller = request.priceForSeller - request.priceImport,
                    ProfitAvailable = request.discountPercent != null
                                        ? getDiscountPrice(request.priceAvailable, request.discountPercent) - request.priceImport
                                        : request.discountAvailable != null
                                            ? (request.discountAvailable - request.priceImport)
                                            : (request.priceAvailable - request.priceImport),
                    ProfitPreOrder = request.discountPercent != null
                                        ? getDiscountPrice(request.pricePreOrder, request.discountPercent) - request.priceImport
                                        : request.discountPreOrder != null
                                            ? (request.discountPreOrder - request.priceImport)
                                            : (request.pricePreOrder - request.priceImport),
                };
                await _productRepo.AddAsync(product);
                await _productRepo.SaveChangesAsync();

                /*
                 * Relationship data
                 */
                // Options
                List<int> optionValueIds = request.currentOptions;
                if (optionValueIds.Count > 0)
                {
                    var productOptionValues = optionValueIds.Select(id => new ProductOptionValue
                    {
                        ProductId = product.ProductId,
                        OptionValueId = id
                    }).ToList();
                    await _productOptionValueRepo.AddRangeAsync(productOptionValues);
                    await _productOptionValueRepo.SaveChangesAsync();
                }
                // New option value
                List<OptionModel> newOptions = request.newOptions;
                if (newOptions.Count > 0)
                {
                    foreach (var option in newOptions)
                    {
                        var optionId = option.id;
                        var existingOptionValues = await _optionValueRepo.Entity()
                            .Where(i => i.OptionId == optionId)
                            .Select(i => i.OptionValueName)
                            .ToListAsync();

                        // Get new values of list;
                        // Lấy các giá trị khác với db;
                        var newOptionValues = option.values
                            .Select(value => value.name.Trim())
                            .Except(existingOptionValues)
                            .ToList();

                        var currentOptionValues = option.values
                            .Select(value => value.name.Trim())
                            .Intersect(existingOptionValues)
                            .ToList();

                        if (newOptionValues.Any())
                        {
                            var newOptionValueEntities = newOptionValues
                                .Select(value => new OptionValue
                                {
                                    OptionId = optionId,
                                    OptionValueName = value.Trim(),
                                    IsBaseValue = false
                                })
                                .ToList();

                            await _optionValueRepo.AddRangeAsync(newOptionValueEntities);
                            await _optionValueRepo.SaveChangesAsync();

                            var newOptionValueIds = newOptionValueEntities.Select(e => e.OptionValueId).ToList();
                            await addProductOptionValueByProductId(product.ProductId, newOptionValueIds);
                        }

                        if (currentOptionValues.Any())
                        {
                            var currentOptionValueIds = await _optionValueRepo.Entity()
                                .Where(i => i.OptionId == optionId && currentOptionValues.Contains(i.OptionValueName))
                                .Select(i => i.OptionValueId)
                                .ToListAsync();

                            await addProductOptionValueByProductId(product.ProductId, currentOptionValueIds);
                        }
                    }
                }

                return new SuccessResponse<bool>();
            }
            catch (Exception error)
            {
                return new FailResponse<bool>(error.Message);
            }
        }
        public async Task<Response<bool>> delete(List<int> ids)
        {
            try
            {
                return new SuccessResponse<bool>();
            }
            catch (Exception error)
            {
                return new FailResponse<bool>(error.Message);
            }
        }
        public async Task<Response<DiscountModel>> getDiscount(DiscountGetRequest request)
        {
            try
            {
                var now = DateTime.Now;
                var result = await _discountRepo
                    .Entity()
                    .Where(i =>
                        i.StartDate <= now &&
                        i.EndDate >= now &&
                        i.Status == 1)
                    .Select(i => new DiscountModel
                    {
                        id = i.DiscountId,
                        code = i.DiscountCode,
                        value = i.DiscountValue,
                        type = (bool)i.ForGlobal ? DiscountTypeEnum.global :
                               (bool)i.ForShop ? DiscountTypeEnum.shop :
                               (bool)i.ForBrand ? DiscountTypeEnum.brand : DiscountTypeEnum.global,
                        isPercent = i.IsPercent,
                    })
                    .FirstOrDefaultAsync();

                return new SuccessResponse<DiscountModel>(result);
            }
            catch (Exception error)
            {
                return new FailResponse<DiscountModel>(error.Message);
            }
        }
        private async Task addProductOptionValueByProductId(int productId, List<int> optValIds)
        {
            var productOptionValues = optValIds.Select(optValId => new ProductOptionValue
            {
                ProductId = productId,
                OptionValueId = optValId
            });

            await _productOptionValueRepo.AddRangeAsync(productOptionValues);
            await _productOptionValueRepo.SaveChangesAsync();
        }
        private decimal? getDiscountPrice(decimal? price, byte? percent)
        {
            var priceDiscounted = price - (price * percent / 100);
            return (decimal)priceDiscounted;
        }
        private async Task<string> getNewPPC()
        {
            var newestId = await _productRepo
                .Entity()
                .OrderByDescending(s => s.ProductId)
                .Select(i => i.ProductId)
                .FirstOrDefaultAsync();

            byte[] buffer = Guid.NewGuid().ToByteArray();
            string guid = BitConverter.ToUInt32(buffer, 8).ToString();

            int len = (newestId + 1).ToString().Length;
            var ppc = guid.Substring(0, 8 - len) + (newestId + 1).ToString();

            return ppc;
        }
    }
}
