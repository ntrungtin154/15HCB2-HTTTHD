//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated from a template.
//
//     Manual changes to this file may cause unexpected behavior in your application.
//     Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace CardProcessingApi.Data
{
    using System;
    using System.Collections.Generic;
    
    public partial class TransactionDetail : BaseEntity
    {
        public int TransactionId { get; set; }
        public int MerchantId { get; set; }
        public decimal TransactionAmount { get; set; }
        public System.DateTime TransactionDate { get; set; }
        public System.TimeSpan TransationTime { get; set; }
        public string Description { get; set; }
        public int CardTypeId { get; set; }
        public string KeyedEntry { get; set; }
        public Nullable<int> AuthorizationNumber { get; set; }
        public string AccountNumber { get; set; }
        public string FirstTwelveAccountNumber { get; set; }
        public string CountryCode { get; set; }
        public string FileSource { get; set; }
        public Nullable<System.DateTime> ExpirationDate { get; set; }
        public int TransactionTypeId { get; set; }
        public string ProductName { get; set; }
        public int ProductAmount { get; set; }
    
        public virtual CardType CardType { get; set; }
        public virtual Merchant Merchant { get; set; }
        public virtual TransactionType TransactionType { get; set; }
    }
}
