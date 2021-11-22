namespace cdm.freecalendar.model.Entities;

/// <summary>
/// Represents a project.
/// </summary>
public class Project : BaseEntity
{
    [MaxLength(256)]
    [Required]
    public string? Name { get; set; }

    public DateTime StartDate { get; set; }

    [Required]
    public Company? Company { get; set; }
}