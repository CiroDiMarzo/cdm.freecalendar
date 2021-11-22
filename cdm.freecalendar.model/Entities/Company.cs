namespace cdm.freecalendar.model.Entities;

/// <summary>
/// Represents a company.
/// </summary>
public class Company : BaseEntity
{
    [Required]
    public string? Name { get; set; }
}