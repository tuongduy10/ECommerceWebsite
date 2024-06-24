namespace ECommerce.Data.Abstractions.Entity
{
    public interface IGenericAuditUpdateEntity<T> : IGenericEntity<T>, IAuditUpdate
    {
    }
}
