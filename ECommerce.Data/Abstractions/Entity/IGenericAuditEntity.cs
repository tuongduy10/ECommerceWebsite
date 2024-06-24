namespace ECommerce.Data.Abstractions.Entity
{
    public interface IGenericAuditEntity<T> : IGenericEntity<T>, IAuditable
    {
    }
}
