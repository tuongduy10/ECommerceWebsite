using ECommerce.Application.Repositories;
using ECommerce.Application.Services.Inventory.Dtos;
using ECommerce.Application.Services.UserSrv.Dtos;
using ECommerce.Data.Abstractions;
using ECommerce.Data.Context;
using ECommerce.Data.Entities.Inventory;
using ECommerce.Data.Entities.ProductSchema;
using ECommerce.Utilities.Shared.Responses;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Attribute = ECommerce.Data.Entities.Inventory.Attribute;
using Option = ECommerce.Data.Entities.Inventory.Option;

namespace ECommerce.Application.Services.Inventory
{
    public class InventoryService : IInventoryService
    {
        private readonly ECommerceContext _DbContext;
        private readonly IRepositoryBase<Option> _optionRepo;
        private readonly IRepositoryBase<OptionValue> _optionValueRepo;
        private readonly IRepositoryBase<Brand> _brandRepo;
        private readonly IRepositoryBase<Category> _categoryRepo;
        private readonly IRepositoryBase<BrandCategory> _brandCategoryRepo;
        private readonly IRepositoryBase<SubCategory> _subCategoryRepo;
        private readonly IRepositoryBase<SubCategoryOption> _subCategoryOptionRepo;
        private readonly IRepositoryBase<SubCategoryAttribute> _subCategoryAttributeRepo;
        private readonly IRepositoryBase<ProductOptionValue> _productOptionValuesRepo;
        private readonly IRepositoryBase<ProductAttribute> _productAttributeRepo;
        private readonly IRepositoryBase<SizeGuide> _sizeGuideRepo;
        private readonly IRepositoryBase<Attribute> _attributeRepo;
        private readonly IUnitOfWork _uow;
        public InventoryService(ECommerceContext DbContext,
            IRepositoryBase<Option> optionRepo,
            IRepositoryBase<OptionValue> optionValueRepo,
            IRepositoryBase<Brand> brandRepo,
            IRepositoryBase<Category> categoryRepo,
            IRepositoryBase<BrandCategory> brandCategoryRepo,
            IRepositoryBase<ShopBrand> shopBrandRepo,
            IRepositoryBase<SubCategory> subCategoryRepo,
            IRepositoryBase<SubCategoryOption> subCategoryOptionRepo,
            IRepositoryBase<SubCategoryAttribute> subCategoryAttributeRepo,
            IRepositoryBase<ProductOptionValue> productOptionValuesRepo,
            IRepositoryBase<ProductAttribute> productAttributeRepo,
            IRepositoryBase<SizeGuide> sizeGuideRepo,
            IRepositoryBase<Attribute> attributeRepo,
            IUnitOfWork uow)
        {
            _DbContext = DbContext;
            _optionRepo = optionRepo;
            _optionValueRepo = optionValueRepo;
            _brandRepo = brandRepo;
            _categoryRepo = categoryRepo;
            _brandCategoryRepo = brandCategoryRepo;
            _subCategoryRepo = subCategoryRepo;
            _subCategoryOptionRepo = subCategoryOptionRepo;
            _subCategoryAttributeRepo = subCategoryAttributeRepo;
            _productOptionValuesRepo = productOptionValuesRepo;
            _productAttributeRepo = productAttributeRepo;
            _sizeGuideRepo = sizeGuideRepo;
            _attributeRepo = attributeRepo;
            _uow = uow;
        }
        public async Task<Response<BrandModel>> getBrand(int brandId = 0) 
        {
            try
            {
                var result = await _brandRepo
                    .Entity()
                    .Where(i => i.BrandId == brandId)
                    .Select(i => new BrandModel()
                    {
                        id = i.BrandId,
                        name = i.BrandName,
                        imagePath = i.BrandImagePath,
                        isActive = i.Status,
                        createdDate = i.CreatedDate,
                        description = i.Description,
                        descriptionTitle = i.DescriptionTitle,
                        isHighlights = i.Highlights,
                        isNew = i.New
                    })
                    .FirstOrDefaultAsync();

                return new SuccessResponse<BrandModel>(result);
            }
            catch (Exception error)
            {
                return new FailResponse<BrandModel>(error.Message);
            }
        }
        public async Task<Response<List<BrandModel>>> getBrands(BrandGetRequest request)
        {
            try
            {
                var shopId = request.shopId;
                var categoryId = request.categoryId;

                var result = await _brandRepo.Queryable(_ =>
                    (shopId == -1 || _.ShopBrands.Any(i => i.ShopId == shopId)) &&
                    (categoryId == -1 || _.BrandCategories.Any(i => i.CategoryId == categoryId)),"")
                    .Select(i => new BrandModel
                    {
                        id = i.BrandId,
                        name = i.BrandName,
                        imagePath = i.BrandImagePath,
                        isActive = i.Status,
                        createdDate = i.CreatedDate,
                        description = i.Description,
                        descriptionTitle = i.DescriptionTitle,
                        isHighlights = i.Highlights,
                        isNew = i.New,
                        categoryNames = i.BrandCategories.Select(_ => _.Category.CategoryName).ToList()
                    })
                    .ToListAsync();

                return new SuccessResponse<List<BrandModel>>(result);
            }
            catch (Exception error)
            {
                return new FailResponse<List<BrandModel>>(error.Message);
            }
        }
        public async Task<Response<List<CategoryModel>>> getCategories()
        {
            try
            {
                var res = await _categoryRepo.Queryable(_ => _.CategoryId > -1, "SubCategories")
                    .Select(_ => (CategoryModel)_)
                    .ToListAsync();
                return new SuccessResponse<List<CategoryModel>>(res);
            }
            catch (Exception error)
            {
                return new FailResponse<List<CategoryModel>>(error.Message);
            }
        }
        public async Task<Response<CategoryModel>> getCategory(int id)
        {
            try
            {
                var res = await _categoryRepo.Queryable(_ => _.CategoryId == id, "SubCategories")
                    .Select(_ => (CategoryModel)_)
                    .FirstOrDefaultAsync();
                return new SuccessResponse<CategoryModel>(res);
            }
            catch (Exception error)
            {
                return new FailResponse<CategoryModel>(error.Message);
            }
        }
        public async Task<Response<Category>> updateCategory(CategoryModelRequest req)
        {
            try
            {
                var entity = await _categoryRepo.Queryable(_ => _.CategoryId == req.id, "")
                    .FirstOrDefaultAsync();
                if (entity != null)
                {
                    if (!string.IsNullOrEmpty(req.name))
                        entity.CategoryName = req.name;
                    _categoryRepo.Update(entity);
                    await _uow.SaveChangesAsync();
                }
                return new SuccessResponse<Category>(entity);
            }
            catch (Exception error)
            {
                return new FailResponse<Category>(error.Message);
            }
        }
        public async Task<Response<Category>> addCategory(CategoryModelRequest req)
        {
            try
            {
                var entity = await _categoryRepo.Queryable(_ => _.CategoryId == req.id, "")
                    .FirstOrDefaultAsync();
                if (entity == null)
                {
                    var newEntity = new Category();
                    if (!string.IsNullOrEmpty(req.name))
                        newEntity.CategoryName = req.name;
                    await _categoryRepo.AddAsync(newEntity);
                    await _uow.SaveChangesAsync();
                    return new SuccessResponse<Category>(newEntity);
                }
                return new SuccessResponse<Category>();
            }
            catch (Exception error)
            {
                return new FailResponse<Category>(error.Message);
            }
        }
        public async Task<Response<List<SubCategoryModel>>> getSubCategories(InventoryRequest request)
        {
            try
            {
                var subCategoryId = request.subCategoryId;
                var brandId = request.brandId;

                var list = await _subCategoryRepo.Queryable(_ =>
                    (subCategoryId == -1 || _.SubCategoryId == subCategoryId) &&
                    (brandId == -1 || _brandCategoryRepo
                        .Entity()
                        .Any(brand => _.CategoryId == brand.CategoryId && brand.BrandId == brandId)), "")
                    .Select(subc => new SubCategoryModel
                    {
                        id = subc.SubCategoryId,
                        name = subc.SubCategoryName,
                        categoryId = subc.CategoryId,
                        category = (CategoryModel)subc.Category,
                        optionList = _subCategoryOptionRepo
                            .Entity()
                            .Where(subcopt => subcopt.SubCategoryId == subc.SubCategoryId)
                            .Select(lo => new OptionModel
                            {
                                id = lo.OptionId,
                                name = lo.Option.OptionName,
                                values = _optionValueRepo
                                    .Entity()
                                    .Where(optionvalue => optionvalue.OptionId == lo.OptionId)
                                    .Select(lop => new OptionValueModel
                                    {
                                        id = lop.OptionValueId,
                                        name = lop.OptionValueName,
                                        totalRecord = _productOptionValuesRepo.Entity()
                                            .Where(ov => 
                                                ov.OptionValueId == lop.OptionValueId &&
                                                ov.Product.SubCategoryId == subc.SubCategoryId)
                                            .Select(ov => ov.ProductId)
                                            .Count(),
                                        isBase = (bool)lop.IsBaseValue
                                    })
                                    .ToList()
                            })
                            .ToList(),
                        attributes = subc.SubCategoryAttributes
                            .Select(sa => new AttributeModel
                            {
                                id = sa.AttributeId,
                                name = sa.Attribute.AttributeName
                            })
                            .ToList(),
                        
                        sizeGuide = subc.SizeGuide != null 
                            ? new SizeGuideModel
                            {
                                id = (int)subc.SizeGuideId,
                                content = subc.SizeGuide.SizeContent,
                                isBase = (bool)subc.SizeGuide.IsBaseSizeGuide,
                            } 
                            : null
                    })
                    .ToListAsync();

                return new SuccessResponse<List<SubCategoryModel>>(list);
            }
            catch(Exception error)
            {
                return new FailResponse<List<SubCategoryModel>>(error.Message);
            }
        }
        public async Task<Response<SubCategory>> addSubCategory(SubCategoryModel request)
        {
            if (string.IsNullOrEmpty(request.name))
                return new FailResponse<SubCategory>("Nhập tên loại");
            var check = await _uow.Repository<SubCategory>().AnyAsync(_ => _.SubCategoryName == request.name.Trim());
            if (check)
                return new FailResponse<SubCategory>("Loại đã tồn tại");

            var transaction = await _DbContext.Database.BeginTransactionAsync();
            try
            {
                var entity = new SubCategory();
                entity.SubCategoryName = request.name.Trim();
                entity.CategoryId = request.categoryId;
                await _subCategoryRepo.AddAsync(entity);
                await _uow.SaveChangesAsync();

                // attributes
                if (request.attributes.Count > 0)
                {
                    var attrs = request.attributes
                        .Select(_ => new SubCategoryAttribute
                        {
                            SubCategoryId = entity.SubCategoryId,
                            AttributeId = _.id,
                        })
                        .ToList();
                    await _subCategoryAttributeRepo.AddRangeAsync(attrs);
                    await _uow.SaveChangesAsync();
                }
                // options
                if (request.optionList.Count > 0)
                {
                    var opts = request.optionList
                        .Select(_ => new SubCategoryOption
                        {
                            SubCategoryId = entity.SubCategoryId,
                            OptionId = _.id
                        })
                        .ToList();
                    await _subCategoryOptionRepo.AddRangeAsync(opts);
                    await _uow.SaveChangesAsync();
                }
                await transaction.CommitAsync();
                return new SuccessResponse<SubCategory>();
            }
            catch (Exception error)
            {
                await transaction.RollbackAsync();
                return new FailResponse<SubCategory>(error.Message);
            }
        }
        public async Task<Response<SubCategory>> updateSubCategory(SubCategoryModel request)
        {
            if (request.id == -1)
                return new FailResponse<SubCategory>("Not found");
            if (string.IsNullOrEmpty(request.name))
                return new FailResponse<SubCategory>("Nhập tên loại");
            var entity = await _subCategoryRepo.GetAsyncWhere(_ => _.SubCategoryId == request.id);
            if (entity == null)
                return new FailResponse<SubCategory>("Not exist");

            var transaction = await _DbContext.Database.BeginTransactionAsync();
            try
            {
                entity.SubCategoryName = request.name.Trim();
                entity.CategoryId = request.categoryId;
                _subCategoryRepo.Update(entity);
                await _uow.SaveChangesAsync();

                // attributes
                await _subCategoryAttributeRepo.RemoveRangeAsyncWhere(_ => _.SubCategoryId == entity.SubCategoryId);
                await _uow.SaveChangesAsync();
                if (request.attributes.Count > 0)
                {
                    var attrs = request.attributes
                        .Select(_ => new SubCategoryAttribute
                        {
                            SubCategoryId = entity.SubCategoryId,
                            AttributeId = _.id,
                        })
                        .ToList();
                    await _subCategoryAttributeRepo.AddRangeAsync(attrs);
                    await _uow.SaveChangesAsync();
                }

                // options
                await _subCategoryOptionRepo.RemoveRangeAsyncWhere(_ => _.SubCategoryId == entity.SubCategoryId);
                await _uow.SaveChangesAsync();
                if (request.optionList.Count > 0)
                {
                    var opts = request.optionList
                        .Select(_ => new SubCategoryOption
                        {
                            SubCategoryId = entity.SubCategoryId,
                            OptionId = _.id
                        })
                        .ToList();
                    await _subCategoryOptionRepo.AddRangeAsync(opts);
                    await _uow.SaveChangesAsync();
                }
                await transaction.CommitAsync();
                return new SuccessResponse<SubCategory>();
            }
            catch (Exception error)
            {
                await transaction.RollbackAsync();
                return new FailResponse<SubCategory>(error.Message);
            }
        }
        public async Task<Response<bool>> deleteSubCategory(int id)
        {
            var ent = await _uow.Repository<SubCategory>().FindByAsync(_ => _.SubCategoryId == id);
            if (ent != null)
            {
                ent.IsDeleted = true;
                _uow.Repository<SubCategory>().Update(ent);
                await _uow.SaveChangesAsync();
            }
            return new SuccessResponse<bool>();
        }
        public async Task<Response<List<OptionModel>>> getOptions(InventoryRequest request)
        {
            try
            {
                var opts = await _optionRepo
                    .Queryable(_ => (request.id == -1 || _.OptionId == request.id)
                        && (string.IsNullOrEmpty(request.name) || request.name == _.OptionName))
                    .Select(opt => new OptionModel
                    {
                        id = opt.OptionId,
                        name = opt.OptionName,
                        values = opt.OptionValues.Select(_ => (OptionValueModel)_).ToList()
                    })
                    .ToListAsync();
                return new SuccessResponse<List<OptionModel>>(opts);
            }
            catch (Exception error)
            {
                return new FailResponse<List<OptionModel>>(error.Message);
            }
        }
        public async Task<Response<bool>> addOptions(OptionModel request)
        {
            if (string.IsNullOrEmpty(request.name))
                return new FailResponse<bool>("Nhập tên");
            var isExisted = await _uow.Repository<Option>().AnyAsync(_ => _.OptionName == request.name.Trim());
            if (isExisted)
                return new FailResponse<bool>("Tên đã tồn tại");

            var transaction = await _DbContext.Database.BeginTransactionAsync();
            try
            {
                // options
                var entity =  new Option()
                {
                    OptionName = request.name
                };
                await _optionRepo.AddAsync(entity);
                await _uow.SaveChangesAsync();

                // option values
                var optionValues = request.values
                    .Select(_ => new Data.Entities.Inventory.OptionValue
                    {
                        IsBaseValue = true,
                        OptionValueName = _.name,
                        OptionId = entity.OptionId
                    })
                    .ToList();
                await _optionValueRepo.AddRangeAsync(optionValues);
                await _uow.SaveChangesAsync();

                await transaction.CommitAsync();
                return new SuccessResponse<bool>();
            }
            catch (Exception ex)
            {
                await transaction.RollbackAsync();
                return new FailResponse<bool>(ex.Message);
            }
        }
        public async Task<Response<bool>> updateOptions(OptionModel request)
        {
            if (request.id == -1)
                return new FailResponse<bool>("Chọn tùy chọn");
            if (string.IsNullOrEmpty(request.name))
                return new FailResponse<bool>("Nhập tên");
            var option = await _optionRepo.GetAsyncWhere(_ => _.OptionId == request.id, "OptionValues.ProductOptionValues");
            if (option == null)
                return new FailResponse<bool>("Không tồn tại");

            var transaction = await _DbContext.Database.BeginTransactionAsync();
            try
            {
                // options
                option.OptionName = request.name;
                _optionRepo.Update(option);
                await _uow.SaveChangesAsync();

                // option values
                var existingValues = option.OptionValues.ToDictionary(v => v.OptionValueName);
                foreach (var newValue in request.values)
                {
                    // Update to isBase
                    if (existingValues.TryGetValue(newValue.name, out var existingValue))
                    {
                        if (existingValue.IsBaseValue == false)
                        {
                            existingValue.IsBaseValue = true;
                            _optionValueRepo.Update(existingValue);
                        }
                    }
                    // Add new
                    else
                    {
                        await _optionValueRepo.AddAsync(new Data.Entities.Inventory.OptionValue
                        {
                            OptionId = option.OptionId,
                            OptionValueName = newValue.name,
                            IsBaseValue = true
                        });
                        await _uow.SaveChangesAsync();
                    }
                }
                // Remove Option Values not in request.values
                var valuesToRemove = option.OptionValues
                    .Where(v => !request.values.Any(nv => nv.name == v.OptionValueName) && v.IsBaseValue == true)
                    .ToList();
                foreach (var value in valuesToRemove)
                {
                    var proOptValues = value.ProductOptionValues;
                    _uow.Repository<ProductOptionValue>().Delete(proOptValues);
                    await _uow.SaveChangesAsync();
                }
                _uow.Repository<OptionValue>().Delete(valuesToRemove);
                await _uow.SaveChangesAsync();

                await transaction.CommitAsync();
                return new SuccessResponse<bool>();
            }
            catch (Exception ex)
            {
                await transaction.RollbackAsync();
                return new FailResponse<bool>(ex.Message);
            }
        }
        public async Task<Response<bool>> deleteOption(int id)
        {
            var transaction = await _uow.BeginTransactionAsync();
            try
            {
                var productOptionValues = await _uow.Repository<ProductOptionValue>().GetByAsync(_ => _.OptionValue.OptionId == id, null, "OptionValue");
                if (productOptionValues.Count() > 0)
                    _uow.Repository<ProductOptionValue>().Delete(productOptionValues);

                var subCategoryOptions = await _uow.Repository<SubCategoryOption>().GetByAsync(_ => _.OptionId == id);
                if (subCategoryOptions.Count() > 0)
                    _uow.Repository<SubCategoryOption>().Update(subCategoryOptions);

                var optionValues = await _uow.Repository<OptionValue>().GetByAsync(_ => _.OptionId == id);
                if (optionValues.Count() > 0)
                    _uow.Repository<OptionValue>().Delete(optionValues);

                var options = await _uow.Repository<Option>().GetByAsync(_ => _.OptionId == id);
                if (options.Count() > 0)
                    _uow.Repository<Option>().Delete(options);

                await _uow.SaveChangesAsync();
                await _uow.CommitTransactionAsync(transaction);
                return new SuccessResponse<bool>();
            }
            catch
            {
                await transaction.RollbackAsync();
                throw;
            }
        }
        public async Task<Response<List<OptionModel>>> getProductOptions(InventoryRequest request)
        {
            try
            {
                var productId = request.productId;
                var subCategoryId = request.subCategoryId;

                if (productId > -1)
                {
                    var opts = await _optionRepo
                        .Entity()
                        .Where(opt => _productOptionValuesRepo
                            .Entity()
                            .Any(pov => pov.ProductId == productId && pov.OptionValue.OptionId == opt.OptionId))
                        .Select(opt => new OptionModel
                        {
                            id = opt.OptionId,
                            name = opt.OptionName,
                            values = _productOptionValuesRepo
                                .Entity()
                                .Where(pov => pov.ProductId == productId && pov.OptionValue.OptionId == opt.OptionId)
                                .Select(pov => new OptionValueModel
                                {
                                    id = pov.OptionValue.OptionValueId,
                                    name = pov.OptionValue.OptionValueName,
                                    isBase = (bool)pov.OptionValue.IsBaseValue
                                })
                                .ToList()
                        })
                        .ToListAsync();
                    return new SuccessResponse<List<OptionModel>>(opts);
                }
                if (subCategoryId > -1)
                {
                    var isBase = request.isBase;
                    var subCategoryOpts = await _subCategoryOptionRepo
                        .Entity()
                        .Where(i => i.SubCategoryId == subCategoryId)
                        .Select(i => new OptionModel
                        {
                            id = i.OptionId,
                            name = i.Option.OptionName,
                            values = _optionValueRepo
                                .Entity()
                                .Where(pov => pov.OptionId == i.OptionId)
                                .Select(pov => new OptionValueModel
                                {
                                    id = pov.OptionValueId,
                                    name = pov.OptionValueName,
                                    totalRecord = _productOptionValuesRepo.Entity()
                                            .Where(ov =>
                                                ov.OptionValueId == pov.OptionValueId &&
                                                ov.Product.SubCategoryId == subCategoryId)
                                            .Select(ov => ov.ProductId)
                                            .Count(),
                                    isBase = (bool)pov.IsBaseValue
                                })
                                .Where(pov => !isBase || (isBase == true && pov.isBase))
                                .ToList()
                        })
                        .ToListAsync();
                    return new SuccessResponse<List<OptionModel>>(subCategoryOpts);
                }
                return new SuccessResponse<List<OptionModel>>();
            }
            catch (Exception error)
            {
                return new FailResponse<List<OptionModel>>(error.Message);
            }
        }
        public async Task<Response<List<AttributeModel>>> getAttributes(InventoryRequest request)
        {
            try
            {
                var subCategoryAttrs = await _attributeRepo
                    .Queryable(_ => (request.id == -1 || _.AttributeId == request.id)
                        && (string.IsNullOrEmpty(request.keyword) || _.AttributeName.Contains(request.keyword.Trim())))
                    .Select(_ => (AttributeModel)_)
                    .ToListAsync();
                return new SuccessResponse<List<AttributeModel>>(subCategoryAttrs);
            }
            catch (Exception error)
            {
                return new FailResponse<List<AttributeModel>>(error.Message);
            }
        }
        public async Task<Response<bool>> deleteAttribute(int id)
        {
            var ent = await _uow.Repository<Attribute>().FindByAsync(_ => _.AttributeId == id);
            if (ent != null)
            {
                ent.IsDeleted = true;
                _uow.Repository<Attribute>().Update(ent);
                await _uow.SaveChangesAsync();
            }
            return new SuccessResponse<bool>();
        }
        public async Task<Response<bool>> saveAttributes(InventoryRequest request)
        {
            try
            {
                if (string.IsNullOrEmpty(request.name))
                    return new FailResponse<bool>("Nhập tên");

                string name = request.name.Trim();

                var entity = await _attributeRepo.GetAsyncWhere(_ => _.AttributeId == request.id);
                if (entity != null)
                {
                    entity.AttributeName = name;
                    _attributeRepo.Update(entity);
                }
                else
                {
                    var newEntity = new Data.Entities.Inventory.Attribute
                    {
                        AttributeName = name
                    };
                    await _attributeRepo.AddAsync(newEntity);
                }
                await _uow.SaveChangesAsync();
                return new SuccessResponse<bool>();
            }
            catch (Exception error)
            {
                return new FailResponse<bool>(error.Message);
            }
        }
        public async Task<Response<List<AttributeModel>>> getProductAttributes(InventoryRequest request)
        {
            try
            {
                var productId = request.productId;
                var subCategoryId = request.subCategoryId;

                if (productId > -1)
                {
                    var productQuery = _productAttributeRepo
                        .Entity()
                        .Where(i => i.ProductId == productId);
                    var attributes = await productQuery
                        .Select(i => new AttributeModel
                        {
                            id = i.AttributeId,
                            value = i.Value,
                            name = i.Attribute != null
                                ? i.Attribute.AttributeName
                                : "",
                        })
                        .ToListAsync();
                    return new SuccessResponse<List<AttributeModel>>(attributes);
                }
                if (subCategoryId > -1)
                {
                    var subCategoryAttrs = await _subCategoryAttributeRepo
                        .Entity()
                        .Where(i => i.SubCategoryId == subCategoryId)
                        .Select(i => new AttributeModel
                        {
                            id = i.Attribute.AttributeId,
                            name = i.Attribute.AttributeName
                        })
                        .ToListAsync();
                    return new SuccessResponse<List<AttributeModel>>(subCategoryAttrs);
                }
                return new SuccessResponse<List<AttributeModel>>();
            }
            catch (Exception error)
            {
                return new FailResponse<List<AttributeModel>>(error.Message);
            }
        } 
        public async Task<Response<List<SizeGuideModel>>> getProductSizeGuides()
        {
            try
            {
                var list = await _sizeGuideRepo.Entity()
                    .Select(i => new SizeGuideModel
                    {
                        id = i.SizeGuideId,
                        content = i.SizeContent,
                        isBase = (bool)i.IsBaseSizeGuide,
                        subCategories = i.SubCategories
                            .Where(sc => sc.SizeGuideId == i.SizeGuideId)
                            .Select(sc => new SubCategoryModel
                            {
                                id = sc.SubCategoryId,
                                name = sc.SubCategoryName
                            })
                            .ToList()
                    })
                    .ToListAsync();
                return new SuccessResponse<List<SizeGuideModel>>();
            }
            catch (Exception error)
            {
                return new FailResponse<List<SizeGuideModel>>(error.Message);
            }
        }
        public async Task<Response<bool>> saveSizeGuide(SizeGuideModel request)
        {
            bool isUpading = request.id > -1;
            if (isUpading)
            {
                var ent = await _uow.Repository<SizeGuide>().GetByIdAsync(request.id);
                if (ent != null)
                {
                    ent.SizeContent = request.content;
                    _uow.Repository<SizeGuide>().Update(ent);
                }
                await _uow.SaveChangesAsync();
            }
            else
            {
                var newEnt = new SizeGuide
                {
                    SizeContent = request.content
                };
                await _uow.Repository<SizeGuide>().AddAsync(newEnt);
                await _uow.SaveChangesAsync();
                
                var sub = await _uow.Repository<SubCategory>().GetByIdAsync(request.subCategoryId);
                if (sub != null)
                {
                    sub.SizeGuideId = newEnt.SizeGuideId;
                }
                _uow.Repository<SubCategory>().Update(sub);
                await _uow.SaveChangesAsync();
            }
            return new SuccessResponse<bool>();
        }
    }
}
