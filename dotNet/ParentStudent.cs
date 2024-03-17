using Sabio.Models.Domain.Users;
using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Sabio.Models.Domain.ParentStudent
{
    public class ParentStudent
    {
        public BaseUser Parent { get; set; }

        public BaseUser Student { get; set; }

        public bool IsConfirmed { get; set; }

    }
}
