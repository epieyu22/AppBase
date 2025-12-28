namespace Systems.JulianaCloud.TransferObjects.Novelties
{
    public class NoveltyHistoricTO
    {
        public decimal Key { get; set; }

        public short EmployeeCode { get; set; }

        public virtual NoveltyEmployeeTO Employee { get; set; }

        public short? ConceptCode { get; set; }

        public virtual NoveltyConceptTO Concept { get; set; }

        public string NoveltieDate { get; set; }

        public string RegistrationDate { get; set; }

        public double Value { get; set; }

        public float Days { get; set; }

        public float Hours { get; set; }

        public short ZoneCode { get; set; }

        public short BranchOfficeCode { get; set; }

        public short CostCenterCode { get; set; }

        public short DepartmentCode { get; set; }

        public short SubconceptCode { get; set; }

        public string PayrollDate { get; set; }

        public string AprovedAt { get; set; }

        public string AccountingAccount { get; set; }

        public short UserCode { get; set; }

        public string Status { get; set; }

        public string UsedForSalaryBase { get; set; }

        public float Percentage { get; set; }

        public short PositonCode { get; set; }

        public string PaymentModule { get; set; }

        public string AprobationNumber { get; set; }

        public string VoucherNumber { get; set; }
    }
}
