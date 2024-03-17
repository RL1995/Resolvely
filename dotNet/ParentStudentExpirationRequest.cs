using Sabio.Models.Domain.Users;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Sabio.Models.Domain.ParentStudent
{
    public class ParentStudentExpirationRequest : BaseUser
    {

        public  DateTime ExpirationDate { get; set; }
        public bool IsConfirmed {  get; set; }

    }
}
