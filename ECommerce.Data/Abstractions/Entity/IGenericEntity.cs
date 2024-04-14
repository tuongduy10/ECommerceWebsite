namespace ECommerce.Data.Abstractions.Entity
{
    public interface IGenericEntity<T> : IAuditCreate
    {
        T Id { get; set; }
    }
}
