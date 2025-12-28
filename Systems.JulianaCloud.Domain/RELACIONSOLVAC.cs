using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace Systems.JulianaCloud.Domain
{
    [Table("RELACIONSOLVAC")]
  public partial class RELACIONSOLVAC
  {
    public static string[] ESTADOS_BORRABLES = new string[] { " ", "" };

    [Required]
    public int Cod_Solicitud { get; set; }

   
    [Required]
    public int Cod_Vacaciones { get; set; }


  }
}
