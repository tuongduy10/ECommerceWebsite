﻿using ECommerce.Application.Services.ProductSrv.Dtos;
using ECommerce.Application.Common;
using ECommerce.Application.Enums;
using ECommerce.Application.Repositories;
using ECommerce.Application.Services.Inventory;
using ECommerce.Application.Services.Inventory.Dtos;
using ECommerce.Data.Context;
using Microsoft.EntityFrameworkCore;
using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using ECommerce.Application.BaseServices.Rate;
using System.Text.RegularExpressions;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Hosting;
using ECommerce.Application.Services.Common;
using ECommerce.Utilities.Constants;
using ECommerce.Data.Entities.Inventory;
using ECommerce.Data.Entities.ProductSchema;
using ECommerce.Data.Entities.OmsSchema;
using ECommerce.Data.Abstractions;
using ECommerce.Utilities.Shared.Responses;

namespace ECommerce.Application.Services.ProductSrv
{
    public class ProductService : IProductService
    {
        private readonly ECommerceContext _DbContext;
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
        private readonly IRateService _rateService;
        private readonly ICommonService _commonService;
        private readonly IWebHostEnvironment _webHostEnvironment;
        private readonly IUnitOfWork _uow;
        public ProductService(ECommerceContext DbContext,
            IInventoryService inventoryService,
            IRateService rateService,
            ICommonService commonService,
            IWebHostEnvironment webHostEnvironment,
            IUnitOfWork uow)
        {
            _DbContext = DbContext;
            _inventoryService = inventoryService;
            _rateService = rateService;
            _commonService = commonService;
            _webHostEnvironment = webHostEnvironment;
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
            _uow = uow;
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
                var ratesHasValue = rates
                    .Where(i => i.value > 0)
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
                    avgValue = ratesHasValue.Count() > 0 ? (int)Math.Round((double)(ratesHasValue.Sum(i => i.value) / ratesHasValue.Count)) : 0,
                    totalRating = ratesHasValue.Count() > 0 ? ratesHasValue.Count() : 0,
                    rates = rates
                };

                var proEntity = await _uow.Repository<Product>()
                    .FindByAsync(i => i.ProductId == id, "Brand,Shop,SubCategory");
                var product = new ProductModel
                {
                    id = proEntity.ProductId,
                    code = proEntity.ProductCode,
                    ppc = proEntity.Ppc,
                    name = proEntity.ProductName,
                    description = proEntity.ProductDescription,
                    sizeGuide = proEntity.SizeGuide,
                    size = proEntity.SizeGuide,
                    stock = proEntity.ProductStock,

                    delivery = proEntity.Delivery,
                    repay = proEntity.Repay,
                    insurance = proEntity.Insurance,
                    isLegit = proEntity.Legit,
                    isHighlight = proEntity.Highlights,
                    isNew = proEntity.New,

                    shopId = proEntity.ShopId,
                    shop = new ShopModel
                    {
                        id = proEntity.ShopId,
                        name = proEntity.Shop.ShopName,
                    },
                    brandId = proEntity.BrandId,
                    brand = new BrandModel
                    {
                        id = proEntity.BrandId,
                        name = proEntity.Brand.BrandName,
                        description = proEntity.Brand.Description,
                        descriptionTitle = proEntity.Brand.DescriptionTitle,
                        imagePath = proEntity.Brand.BrandImagePath,
                    },
                    subCategoryId = proEntity.SubCategoryId,
                    subCategory = new SubCategoryModel
                    {
                        id = proEntity.SubCategoryId,
                        name = proEntity.SubCategory.SubCategoryName,
                    },

                    attributes = attributes,
                    options = options,
                    importDate = proEntity.ProductImportDate,

                    priceAvailable = proEntity.PriceAvailable,
                    pricePreOrder = proEntity.PricePreOrder,
                    priceForSeller = proEntity.PriceForSeller,
                    priceImport = proEntity.PriceImport,
                    isDiscountPercent = proEntity.DiscountPercent != null || proEntity.DiscountPercent > 0,
                    discountPercent = proEntity.DiscountPercent,
                    discountAvailable = proEntity.DiscountAvailable,
                    discountPreOrder = proEntity.DiscountPreOrder,

                    imagePaths = imagePaths,
                    userImagePaths = userImagePaths,

                    review = review,
                    note = proEntity.Note,
                    link = proEntity.Link,
                };

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
                int brandId = request.brandId;
                int subCategoryId = request.subCategoryId;
                int pageindex = request.PageIndex;
                int pagesize = request.PageSize;
                string orderBy = request.orderBy;
                if (request.id > -1)
                    request.ids.Add(request.id);
                List<int> ids = request.ids;
                List<int> listOptionValueId = request.optionValueIds;

                var proIdsByOption = _productOptionValueRepo.Entity()
                    .Where(i => listOptionValueId != null && listOptionValueId.Contains(i.OptionValueId))
                    .Select(i => i.ProductId)
                    .Distinct()
                    .ToList();

                Func<IQueryable<Product>, IOrderedQueryable<Product>> orderByReq = _ => _.OrderByDescending(i => i.ProductAddedDate);
                if (orderBy == "asc")
                    orderByReq = _ => _.OrderBy(i => i.DiscountPreOrder ?? i.DiscountAvailable ?? i.PricePreOrder ?? i.PriceAvailable);
                if (orderBy == "desc")
                    orderByReq = _ => _.OrderByDescending(i => i.DiscountPreOrder ?? i.DiscountAvailable ?? i.PricePreOrder ?? i.PriceAvailable);

                var extQuery = _uow.Repository<Product>().QueryableAsync(
                    _ => _.Status == (byte)ProductStatusEnum.Available &&
                        (ids.Count == 0 || ids.Contains(_.ProductId)) &&
                        (proIdsByOption.Count == 0 || proIdsByOption.Contains(_.ProductId)) &&
                        (brandId == -1 || _.BrandId == brandId) &&
                        (subCategoryId == -1 || _.SubCategoryId == subCategoryId) &&
                        (orderBy != "newest" || _.New == true) &&
                        (orderBy != "discount" || _.DiscountAvailable != null || _.DiscountPreOrder != null), 
                    orderByReq, 
                    "Brand");

                var list = extQuery.Select(i => new ProductModel()
                {
                    id = i.ProductId,
                    name = i.ProductName,
                    discountPercent = i.DiscountPercent,
                    status = i.Status,
                    isHighlight = i.Highlights,
                    isNew = i.New,
                    createdDate = i.ProductAddedDate,
                    importDate = i.ProductImportDate,
                    subCategoryId = i.SubCategoryId,

                    priceAvailable = i.PriceAvailable,
                    pricePreOrder = i.PricePreOrder,
                    discountAvailable = i.DiscountAvailable,
                    discountPreOrder = i.DiscountPreOrder,

                    imagePaths = _productImageRepo.Entity()
                            .Where(img => img.ProductId == i.ProductId)
                            .Select(i => i.ProductImagePath)
                            .ToList(),
                    brand = new BrandModel
                    {
                        id = i.BrandId,
                        name = i.Brand.BrandName,
                        // description = i.Brand.Description,
                        descriptionTitle = i.Brand.DescriptionTitle,
                        imagePath = i.Brand.BrandImagePath,
                    },
                });

                var record = await extQuery.CountAsync();
                var data = await PaginatedList<ProductModel>.CreateAsync(list, pageindex, pagesize);
                foreach (var item in data)
                {
                    item.options = _optionRepo.Entity()
                        .Where(opt => _productOptionValueRepo.Entity()
                            .Any(pov => pov.ProductId == item.id && pov.OptionValue.OptionId == opt.OptionId))
                        .Select(opt => new OptionModel
                        {
                            id = opt.OptionId,
                            name = opt.OptionName,
                            values = _productOptionValueRepo.Entity()
                                .Where(pov =>
                                    pov.ProductId == item.id && pov.OptionValue.OptionId == opt.OptionId)
                                .Select(pov => new OptionValueModel
                                {
                                    id = pov.OptionValue.OptionValueId,
                                    name = pov.OptionValue.OptionValueName,
                                })
                                .ToList()
                        })
                        .ToList();
                }
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
        public async Task<Response<PageResult<ProductModel>>> getProductManagedList(ProductGetRequest request)
        {
            try
            {
                var id = request.id;
                var keyword = request.keyword.ToLower();
                var brandId = request.brandId;
                var shopId = request.shopId;
                var subCategoryId = request.subCategoryId;
                var categoryId = request.categoryId;
                int pageIndex = request.PageIndex;
                int pageSize = request.PageSize;

                var extQuery = _uow.Repository<Product>()
                    .QueryableAsync(
                        product =>
                            (id == -1 || product.ProductId == id) &&
                            (shopId == -1 || product.ShopId == shopId) &&
                            (brandId == -1 || product.BrandId == brandId) &&
                            (subCategoryId == -1 || product.SubCategoryId == subCategoryId) &&
                            (categoryId == -1 ||
                                (product.SubCategory != null &&
                                 product.SubCategory.Category != null &&
                                 product.SubCategory.Category.CategoryId == categoryId)) &&
                            (EF.Functions.Like(product.ProductCode, $"%{keyword}%") ||
                                EF.Functions.Like(product.Ppc, $"%{keyword}%") ||
                                EF.Functions.Like(product.ProductName, $"%{keyword}%")),
                        _ => _.OrderByDescending(_ => _.ProductId),
                        "Brand,Shop,SubCategory");
                var list = extQuery
                    .Select(i => new ProductModel()
                    {
                        id = i.ProductId,
                        name = i.ProductName,
                        ppc = i.Ppc,
                        code = i.ProductCode,
                        createdDate = i.ProductAddedDate,
                        status = i.Status,
                        stock = (int)i.ProductStock,
                        subCategoryId = i.SubCategoryId,
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

                        shop = new ShopModel(i.ShopId, i.Shop.ShopName),
                        note = i.Note,
                        link = i.Link
                    });

                var record = await extQuery.CountAsync();
                var data = await PaginatedList<ProductModel>.CreateAsync(list, pageIndex, pageSize); // execute the query here
                var result = new PageResult<ProductModel>()
                {
                    Items = data,
                    CurrentRecord = (pageIndex * pageSize) <= record ? (pageIndex * pageSize) : record,
                    TotalRecord = record,
                    CurrentPage = pageIndex,
                    TotalPage = (int)Math.Ceiling(record / (double)pageSize)
                };

                return new SuccessResponse<PageResult<ProductModel>>(result);
            }
            catch (Exception error)
            {
                return new FailResponse<PageResult<ProductModel>>(error.Message);
            }
        }
        public async Task<Response<bool>> save(ProductSaveRequest request) // add or update
        {
            if (string.IsNullOrEmpty(request.name))
                return new FailResponse<bool>("Vui lòng nhập tên sản phẩm");
            if (request.shopId == -1)
                return new FailResponse<bool>("Vui lòng chọn cửa hàng");
            if (request.brandId == -1)
                return new FailResponse<bool>("Vui lòng chọn thương hiệu");
            if (request.subCategoryId == -1)
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

            using var transaction = await _DbContext.Database.BeginTransactionAsync();
            try
            {
                var hasCode = await _uow.Repository<Product>()
                    .AnyAsync(i => request.code != null && i.ProductCode == request.code.Trim());
                if (hasCode && request.id == -1)
                    return new FailResponse<bool>("Mã này đã tồn tại !");

                var isAdmin = true;
                /*
                 * None relationship data
                 */
                var product = await _uow.Repository<Product>().FindByAsync(_ => _.ProductId == request.id);
                if (product == null)
                    product = new Data.Entities.ProductSchema.Product();
                product.ProductCode = request.code.Trim();
                product.ProductName = request.name.Trim(); // required
                product.Ppc = await getNewPPC();
                product.ProductDescription = request.description ?? null;
                product.SizeGuide = request.sizeGuide ?? null;
                product.Note = string.IsNullOrEmpty(request.note) ? "" : request.note.Trim();
                product.Link = string.IsNullOrEmpty(request.link) ? "" : request.link.Trim();
                product.New = request.isNew;
                product.Legit = request.isLegit;
                product.Highlights = request.isHighlight;
                product.Delivery = !string.IsNullOrEmpty(request.delivery) ? request.delivery.Trim() : null;
                product.ProductStock = request.stock;
                product.Repay = !string.IsNullOrEmpty(request.repay) ? request.repay.Trim() : null;
                product.Insurance = string.IsNullOrEmpty(request.insurance) ? "" : request.insurance.Trim();
                product.ShopId = request.shopId;
                product.BrandId = request.brandId;
                product.SubCategoryId = request.subCategoryId;
                product.ProductAddedDate = DateTime.Now; // default
                product.Status = isAdmin ? (byte?)ProductStatusEnum.Available : (byte?)ProductStatusEnum.Pending;
                //Price
                product.DiscountPercent = request.discountPercent ?? null;
                product.PriceAvailable = request.priceAvailable ?? null;
                product.PricePreOrder = request.pricePreOrder ?? null;
                product.PriceForSeller = request.priceForSeller ?? null;
                product.PriceImport = request.priceImport ?? null;
                product.DiscountAvailable = request.discountPercent != null
                    ? getDiscountPrice(request.priceAvailable, request.discountPercent)
                    : (request.discountAvailable ?? null);
                product.DiscountPreOrder = request.discountPercent != null
                    ? getDiscountPrice(request.pricePreOrder, request.discountPercent)
                    : (request.discountPreOrder ?? null);
                product.ProfitForSeller = request.priceForSeller - request.priceImport;
                product.ProfitAvailable = request.discountPercent != null
                    ? getDiscountPrice(request.priceAvailable, request.discountPercent) - request.priceImport
                    : request.discountAvailable != null
                        ? (request.discountAvailable - request.priceImport)
                        : (request.priceAvailable - request.priceImport);
                product.ProfitPreOrder = request.discountPercent != null
                    ? getDiscountPrice(request.pricePreOrder, request.discountPercent) - request.priceImport
                    : request.discountPreOrder != null
                        ? (request.discountPreOrder - request.priceImport)
                        : (request.pricePreOrder - request.priceImport);
                if (request.id > -1)
                {
                    _uow.Repository<Product>().Update(product);
                } 
                else
                {
                    await _uow.Repository<Product>().AddAsync(product);
                }
                await _uow.SaveChangesAsync();

                /*
                 * Relationship data
                 */
                // Options
                // Remove all current option values
                var optionvaluelist = await _uow.Repository<ProductOptionValue>().GetAllAsync();
                await _productOptionValueRepo.RemoveRangeAsyncWhere(_ => _.ProductId == request.id);
                await _uow.SaveChangesAsync();
                // Add or Update
                if (request.options.Count > 0)
                {
                    foreach (var option in request.options)
                    {
                        var optionValuesFromDb = (await _optionValueRepo.ToListAsyncWhere(i => i.OptionId == option.id))
                            .Select(i => i.OptionValueName.Trim())
                            .ToList();
                        var optionValuesFromReq = option.values.Select(i => i.name.Trim()).ToList();

                        // Optionvalues from Db in request;
                        var optionValues = optionValuesFromDb.Where(_ => optionValuesFromReq.Contains(_)).ToList();
                        if (optionValues.Any())
                        {
                            // Migrate product to current option value
                            var optionValueIds = (await _optionValueRepo
                                    .ToListAsyncWhere(i => i.OptionId == option.id && optionValues.Contains(i.OptionValueName)))
                                .Select(i => i.OptionValueId)
                                .ToList();
                            await addProductOptionValueByProductId(product.ProductId, optionValueIds);
                        }

                        // Optionvalues from request not in db;
                        var newOptionValues = optionValuesFromReq.Where(_ => !optionValuesFromDb.Contains(_)).ToList();
                        if (newOptionValues.Any())
                        {
                            // add new option value into OptionValue
                            var newOptionValueEntities = newOptionValues
                                .Select(value => new OptionValue
                                {
                                    OptionId = option.id,
                                    OptionValueName = value,
                                    IsBaseValue = false
                                })
                                .ToList();
                            await _optionValueRepo.AddRangeAsync(newOptionValueEntities);
                            await _uow.SaveChangesAsync();

                            // Migrate product to new option value added
                            var newOptionValueIds = newOptionValueEntities.Select(e => e.OptionValueId).ToList();
                            await addProductOptionValueByProductId(product.ProductId, newOptionValueIds);
                        }
                    }
                }

                // Attribute
                // Remove
                await _productAttributeRepo.RemoveRangeAsyncWhere(_ => _.ProductId == request.id);
                await _uow.SaveChangesAsync();
                // Add or Update
                var attributes = request.attributes.Where(a => !string.IsNullOrEmpty(a.value));
                if (attributes != null && attributes.Any())
                {
                    // Add
                    var attrAddReq = attributes
                        .Select(attr => new ProductAttribute
                        {
                            ProductId = product.ProductId,
                            AttributeId = attr.id,
                            Value = attr.value.Trim()
                        })
                        .ToList();
                    await _productAttributeRepo.AddRangeAsync(attrAddReq);
                    await _uow.SaveChangesAsync();
                }

                // Images
                var imagesFromDb = (await _productImageRepo.ToListAsyncWhere(_ => _.ProductId == request.id))
                    .Select(_ => _.ProductImagePath)
                    .ToList();
                // Images from db not in request
                var images = imagesFromDb.Where(_ => !request.systemFileNames.Contains(_)).ToList();
                _commonService.DeleteFiles(_webHostEnvironment, images, FilePathConstant.PRODUCT_FILEPATH);
                await _productImageRepo.RemoveRangeAsyncWhere(_ => _.ProductId == request.id && images.Contains(_.ProductImagePath));
                await _uow.SaveChangesAsync();
                // Add
                if (request.systemFileNames != null)
                {
                    // Images from request not in db
                    var sysImgAddReq = request.systemFileNames
                        .Where(img => !imagesFromDb.Contains(img))
                        .Select(img => new ProductImage
                        {
                            ProductId = product.ProductId,
                            ProductImagePath = img
                        })
                        .ToList();
                    await _productImageRepo.AddRangeAsync(sysImgAddReq);
                    await _uow.SaveChangesAsync();
                }

                // User Images
                var userImagesFromDb = (await _productUserImageRepo.ToListAsyncWhere(_ => _.ProductId == request.id))
                    .Select(_ => _.ProductUserImagePath)
                    .ToList();
                // Images from db not in request
                var userImages = userImagesFromDb.Where(_ => !request.userFileNames.Contains(_)).ToList();
                _commonService.DeleteFiles(_webHostEnvironment, userImages, FilePathConstant.PRODUCT_FILEPATH);
                await _productUserImageRepo.RemoveRangeAsyncWhere(_ => _.ProductId == request.id && userImages.Contains(_.ProductUserImagePath));
                await _uow.SaveChangesAsync();
                // Add
                if (request.userFileNames != null)
                {
                    // Images from request not in db
                    var userImgAddReq = request.userFileNames
                        .Where(_ => !userImagesFromDb.Contains(_))
                        .Select(img => new ProductUserImage
                        {
                            ProductId = product.ProductId,
                            ProductUserImagePath = img
                        })
                        .ToList();
                    await _productUserImageRepo.AddRangeAsync(userImgAddReq);
                    await _uow.SaveChangesAsync();
                }
                await transaction.CommitAsync();
                return new SuccessResponse<bool>();
            }
            catch (Exception error)
            {
                await transaction.RollbackAsync();
                return new FailResponse<bool>(error.Message);
            }
        }
        public async Task<Response<ProductDeleteResponse>> delete(ProductDeleteRequest request)
        {
            
            var ids = request.ids;
            // Check null product
            var products = await _DbContext.Products.Where(i => ids.Contains(i.ProductId)).ToListAsync();
            if (products == null || products.Count == 0) return new FailResponse<ProductDeleteResponse>("Sản phẩm không tồn tại");

            using var transaction = await _DbContext.Database.BeginTransactionAsync();
            try
            {
                // System's iamges
                var sysImages = await _DbContext.ProductImages.Where(i => ids.Contains(i.ProductId)).ToListAsync();
                if (sysImages.Count > 0) _DbContext.ProductImages.RemoveRange(sysImages);
                // User's images
                var userImages = await _DbContext.ProductUserImages.Where(i => ids.Contains((int)i.ProductId)).ToListAsync();
                if (userImages.Count > 0) _DbContext.ProductUserImages.RemoveRange(userImages);
                // Prices
                var productPrices = await _DbContext.ProductPrices.Where(i => ids.Contains(i.ProductId)).ToListAsync();
                if (productPrices.Count > 0) _DbContext.ProductPrices.RemoveRange(productPrices);
                // Attributes
                var attrs = await _DbContext.ProductAttributes.Where(i => ids.Contains(i.ProductId)).ToListAsync();
                if (attrs.Count > 0) _DbContext.ProductAttributes.RemoveRange(attrs);
                // Options
                var opts = await _DbContext.ProductOptionValues.Where(i => ids.Contains(i.ProductId)).ToListAsync();
                if (opts.Count > 0) _DbContext.ProductOptionValues.RemoveRange(opts);
                // Product's comments
                var ratingImages = new List<string>();
                var rateRs = await _rateService.DeleteCommentsByProductIds(ids);
                ratingImages = rateRs.isSucceed ? rateRs.Data : null;

                var data = new ProductDeleteResponse
                {
                    systemImages = sysImages.Select(i => i.ProductImagePath).ToList(),
                    userImages = userImages.Select(i => i.ProductUserImagePath).ToList(),
                    ratingImages = ratingImages
                };

                // Remove product and save changes
                _uow.Repository<Product>().Delete(products);
                _uow.SaveChangesAsync().Wait();

                await transaction.CommitAsync();
                return new SuccessResponse<ProductDeleteResponse>(data);
            }
            catch (Exception error)
            {
                await transaction.RollbackAsync();
                return new FailResponse<ProductDeleteResponse>(error.Message);
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
        public async Task<Response<bool>> updateStatus(UpdateStatusRequest request)
        {
            try
            {
                List<int> ids = request.ids;
                int status = request.status;

                if (ids.Count == 0) 
                    return new FailResponse<bool>("Vui lòng chọn sản phẩm cần cập nhật");
                var productsToUpdate = await _uow.Repository<Product>().GetByAsync(i => ids.Contains(i.ProductId));
                if (productsToUpdate.Count() > 0)
                {
                    foreach (var product in productsToUpdate)
                    {
                        product.Status = (byte?)status;
                    }
                    await _uow.SaveChangesAsync();
                }
                return new SuccessResponse<bool>("Cập nhật thành công");
            }
            catch (Exception error)
            {
                return new FailResponse<bool>("Cập nhật thất bại " + error);
            }
        }
        public async Task<Response<List<string>>> removeUserImages(List<int?> ids)
        {
            try
            {
                if (ids.Count > 0)
                {
                    var userImages = await _uow.Repository<ProductUserImage>().GetByAsync(i => ids.Contains(i.ProductId));
                    var result = userImages.Select(_ => _.ProductUserImagePath).ToList();
                    if (userImages.Count() > 0)
                    {
                        _uow.Repository<ProductUserImage>().Delete(userImages);
                        await _uow.SaveChangesAsync();
                    }
                    return new SuccessResponse<List<string>>(result);
                }
                return new SuccessResponse<List<string>>();
            }
            catch (Exception error)
            {
                return new FailResponse<List<string>>(error.Message);
            }
        }
        public async Task<Response<List<string>>> removeUserImages(List<string> fileNames)
        {
            try
            {
                var ents = await _uow.Repository<ProductUserImage>().GetByAsync(i => fileNames.Contains(i.ProductUserImagePath));
                if (ents.Count() > 0)
                {
                    _uow.Repository<ProductUserImage>().Delete(ents);
                    await _uow.SaveChangesAsync();
                }
                return new SuccessResponse<List<string>>();
            }
            catch (Exception error)
            {
                return new FailResponse<List<string>>(error.Message);
            }
        }
        public async Task<Response<List<string>>> removeSystemImages(List<int?> ids)
        {
            try
            {
                if (ids.Count > 0)
                {
                    var userImages = await _uow.Repository<ProductImage>().GetByAsync(i => ids.Contains(i.ProductId));
                    var result = userImages.Select(_ => _.ProductImagePath).ToList();
                    if (userImages.Count() > 0)
                    {
                        _uow.Repository<ProductImage>().Delete(userImages);
                        await _uow.SaveChangesAsync();
                    }
                    return new SuccessResponse<List<string>>(result);
                }
                return new SuccessResponse<List<string>>();
            }
            catch (Exception error)
            {
                return new FailResponse<List<string>>(error.Message);
            }
        }
        public async Task<Response<List<string>>> removeSystemImages(List<string> fileNames)
        {
            try
            {
                var ents = await _uow.Repository<ProductImage>().GetByAsync(i => fileNames.Contains(i.ProductImagePath));
                if (ents.Count() > 0)
                {
                    _uow.Repository<ProductImage>().Delete(ents);
                    await _uow.SaveChangesAsync();
                }
                return new SuccessResponse<List<string>>();
            }
            catch (Exception error)
            {
                return new FailResponse<List<string>>(error.Message);
            }
        }
        // private functions
        private async Task addProductOptionValueByProductId(int productId, List<int> optValIds)
        {
            var productOptionValues = optValIds.Select(optValId => new ProductOptionValue
            {
                ProductId = productId,
                OptionValueId = optValId
            });

            await _productOptionValueRepo.AddRangeAsync(productOptionValues);
            await _uow.SaveChangesAsync();
        }
        private decimal? getDiscountPrice(decimal? price, byte? percent)
        {
            var priceDiscounted = price - (price * percent / 100);
            return (decimal)priceDiscounted;
        }
        private async Task<string> getNewPPC()
        {
            var newestId = (await _uow.Repository<Product>()
                .FindLastAsync()).ProductId;

            byte[] buffer = Guid.NewGuid().ToByteArray();
            string guid = BitConverter.ToUInt32(buffer, 8).ToString();

            int len = (newestId + 1).ToString().Length;
            var ppc = guid.Substring(0, 8 - len) + (newestId + 1).ToString();

            return ppc;
        }
        private string RemoveDiacritics(string text)
        {
            string decomposed = text.Normalize(NormalizationForm.FormD);
            Regex regex = new Regex("\\p{Mn}", RegexOptions.Compiled);

            return regex.Replace(decomposed, string.Empty).Normalize(NormalizationForm.FormC);
        }
    }
}
