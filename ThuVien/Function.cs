using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Security;

namespace ThuVien
{
    public class Function
    {
        public static void Authentication(string UserName, bool isRemember, string Data = null)
        {
            // Success, create non-persistent authentication cookie.
            FormsAuthentication.SetAuthCookie(UserName, isRemember);

            FormsAuthenticationTicket ticket =
               new FormsAuthenticationTicket(
                    1,                                   // version
                    UserName,   // get username  from the form
                    DateTime.Now,                        // issue time is now
                    DateTime.Now.AddDays(1),         // expires in 1 days
                    false,      // cookie is not persistent
                    Data                              // role assignment is stored
                // in userData
                    );
            HttpCookie cookie = new HttpCookie(
              FormsAuthentication.FormsCookieName,
              FormsAuthentication.Encrypt(ticket));
            HttpContext.Current.Response.Cookies.Add(cookie);
          
        }

        public static int LayUserId(FormsIdentity FormsId)
        {
            int Id = -1;
            string userData = LibEncrypt.Decrypt(FormsId.Ticket.UserData, true);
            string[] data = userData.Split(",".ToCharArray());
            if (int.TryParse(data[0], out Id)) return Id;
            return Id;
        }

        public static string LayUserCode(FormsIdentity FormsId)
        {
            string UserCode = string.Empty;
            string userData = LibEncrypt.Decrypt(FormsId.Ticket.UserData, true);
            string[] data = userData.Split(",".ToCharArray());
            UserCode = data[1];
            return UserCode;
        }

        public static string LayEmail(FormsIdentity FormsId)
        {
            string Email = string.Empty;
            string userData = LibEncrypt.Decrypt(FormsId.Ticket.UserData, true);
            string[] data = userData.Split(",".ToCharArray());
            Email = data[2];
            return Email;
        }

        public static string LayFullName(FormsIdentity FormsId)
        {
            string FullName = string.Empty;
            string userData = LibEncrypt.Decrypt(FormsId.Ticket.UserData, true);
            string[] data = userData.Split(",".ToCharArray());
            FullName = data[3];
            return FullName;
        }

        public static int ParseTrongSo(int TrongSo) {
            int giatri = 0;
            try
            {
                giatri = (int)Math.Pow(2, TrongSo); 
            }
            catch (Exception ex) { }
            return giatri;
        }

        public static string Reverse(string s)
        {
            char[] charArray = s.ToCharArray();
            Array.Reverse(charArray);
            return new string(charArray);
        }

        public static string DecimalToBinary(int num, ref List<int> Values)
        {
            string result = string.Empty;
            int rem = 0;
            int i = 0;
            Values = new List<int>();
            try
            {
                while (num > 0)
                {
                    rem = num % 2;
                    num = num / 2;                    
                    result = rem.ToString() + result;
                }
                
                if (!string.IsNullOrEmpty(result))
                {
                    string revertString = Reverse(result);
                    foreach (char c in revertString)
                    {
                        if (c == '1') {
                            Values.Add((int)Math.Pow(2, i));
                        }
                        i++;
                    }
                }
            }
            catch (Exception ex)
            {
               // error = ex.Message;
            }
            return result;
        }

        public static string LayPageHienTai() {
            return HttpContext.Current.Request.Url.AbsolutePath;
        }

        public static DateTime? ConvertStringToDatetime(string yyyymmdd) {
            DateTime? dt = null;
            try {
                dt = DateTime.ParseExact(yyyymmdd, "yyyy-MM-dd", System.Globalization.CultureInfo.InvariantCulture);
            }
            catch (Exception ex) { }
            return dt;
        }

        public static DateTime? ConvertddMMyyyyToDatetime(string ddMMyyyy)
        {
            DateTime? dt = null;
            try
            {
                string[] arr = ddMMyyyy.Split('/');
                if(arr != null && arr.Length == 3 && ddMMyyyy.Length == 10)
                {
                    string dparse = arr[2] + "/" + arr[1] + "/" + arr[0];
                    DateTime dateparse = DateTime.Now;
                    if (DateTime.TryParse(dparse, out dateparse)) {
                        dt = dateparse;
                    }
                }
            }
            catch (Exception ex) { }
            return dt;
        }
    }
}