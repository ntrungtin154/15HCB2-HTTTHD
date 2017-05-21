﻿using System;
using System.Collections.Generic;
using System.Globalization;
using System.Linq;
using System.Security.Claims;
using System.Threading;
using System.Web;
using CardProcessingApi.Core;

namespace CardProcessingApi.Web.Framework
{
    public class WorkContext : IWorkContext
    {
        #region Ctor.

        public WorkContext()
        {
            WorkingCulture = Thread.CurrentThread.CurrentCulture;
        }

        #endregion

        #region Properties

        public CultureInfo WorkingCulture { get; set; }

        private WorkingUser _user;

        public WorkingUser User
        {
            get { return _user ?? (_user = GetWorkingUser()); }
            set { _user = value; }
        }

        #endregion

        #region Utilities

        /// <summary>
        /// Gets username by removing domain if exists.
        /// </summary>
        /// <param name="fullUserName"></param>
        /// <returns></returns>
        private string GetUserName(string fullUserName)
        {
            var userName = fullUserName;
            var backSlashIndex = userName.IndexOf("\\", StringComparison.Ordinal);
            if (backSlashIndex >= 0 && backSlashIndex < userName.Length - 1)
                return userName.Substring(backSlashIndex + 1);
            return userName;
        }

        private WorkingUser GetWorkingUser()
        {
            var workingUser = new WorkingUser();

            var principal = HttpContext.Current.User as ClaimsPrincipal;
            var identity = principal?.Identity as ClaimsIdentity;
            if (identity != null)
            {
                workingUser.Id = GetClaimIntValue(identity, ClaimTypes.NameIdentifier);
                workingUser.UserName = identity.Name;
                workingUser.FullName = GetClaimStringValue(identity, "FullName");
                workingUser.Roles = new List<Enums.UserRole> { (Enums.UserRole)GetClaimIntValue(identity, ClaimTypes.Role) };
  
            }

            return workingUser;
        }

        private static int GetClaimIntValue(ClaimsIdentity identity, string claimType)
        {
            var claim = identity.FindFirst(claimType);
            return !string.IsNullOrEmpty(claim?.Value) ? int.Parse(claim.Value) : 0;
        }

        private static string GetClaimStringValue(ClaimsIdentity identity, string claimType)
        {
            var claim = identity.FindFirst(claimType);
            return claim != null ? claim.Value : string.Empty;
        }

        #endregion
    }
}