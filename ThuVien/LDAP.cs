using System;
using System.Collections.Generic;
using System.Configuration;
using System.DirectoryServices;
using System.Linq;
using System.Web;

namespace ThuVien
{
    public class LDAP
    {
        public static bool AuthenticateUser(string domainName,string userName, string password)
        {
            bool ret = false;

            try
            {
                if (string.IsNullOrEmpty(domainName))
                    domainName = ConfigurationManager.AppSettings["Domain"] + "";
                DirectoryEntry de =new DirectoryEntry("LDAP://" + domainName,userName, password);
                DirectorySearcher dsearch = new DirectorySearcher(de);
                SearchResult results = null;

                results = dsearch.FindOne();
                
                ret = true;
                //
                //GetAdditionalUserInfo(userName, password);
            }
            catch
            {
                ret = false;
            }

            return ret;
        }

        public static string GetCurrentDomainPath(string domainName, string userName, string password)
        {
            if (string.IsNullOrEmpty(domainName))
                domainName = ConfigurationManager.AppSettings["Domain"] + "";
            //DirectoryEntry de = new DirectoryEntry("LDAP://" + domainName, userName, password);

            //return "LDAP://" + de.Properties["defaultNamingContext"][0].ToString();
            return "LDAP://" + domainName;
        }

        public static void GetAdditionalUserInfo(string userNameLogin, string passwordLogin)
        {
            SearchResultCollection results;
            DirectorySearcher ds = null;
           
            DirectoryEntry de = new DirectoryEntry(GetCurrentDomainPath("",userNameLogin, passwordLogin));

            ds = new DirectorySearcher(de);
            // Full Name
            ds.PropertiesToLoad.Add("name");
            // Email Address
            ds.PropertiesToLoad.Add("mail");
            // First Name
            ds.PropertiesToLoad.Add("givenname");
            // Last Name (Surname)
            ds.PropertiesToLoad.Add("sn");
            // Login Name
            ds.PropertiesToLoad.Add("userPrincipalName");
            // Distinguished Name
            ds.PropertiesToLoad.Add("distinguishedName");

            ds.Filter = "(&(objectCategory=User)(objectClass=person))";

            results = ds.FindAll();

            foreach (SearchResult sr in results)
            {
                if (sr.Properties["name"].Count > 0)
                    Console.WriteLine(sr.Properties["name"][0].ToString());
                // If not filled in, then you will get an error
                if (sr.Properties["mail"].Count > 0)
                    Console.WriteLine(sr.Properties["mail"][0].ToString());
                if (sr.Properties["givenname"].Count > 0)
                    Console.WriteLine(
                         sr.Properties["givenname"][0].ToString());
                if (sr.Properties["sn"].Count > 0)
                    Console.WriteLine(sr.Properties["sn"][0].ToString());
                if (sr.Properties["userPrincipalName"].Count > 0)
                    Console.WriteLine(
                         sr.Properties["userPrincipalName"][0].ToString());
                if (sr.Properties["distinguishedName"].Count > 0)
                    Console.WriteLine(
                         sr.Properties["distinguishedName"][0].ToString());
            }
        }

        private static DirectorySearcher BuildUserSearcher(DirectoryEntry de)
        {
            DirectorySearcher ds = null;

            ds = new DirectorySearcher(de);
            // Full Name
            ds.PropertiesToLoad.Add("name");
            // Email Address
            ds.PropertiesToLoad.Add("mail");
            // First Name
            ds.PropertiesToLoad.Add("givenname");
            // Last Name (Surname)
            ds.PropertiesToLoad.Add("sn");
            // Login Name
            ds.PropertiesToLoad.Add("userPrincipalName");
            // Distinguished Name
            ds.PropertiesToLoad.Add("distinguishedName");

            return ds;
        }

        public static void SearchForUsers(string userName, string userNameLogin, string passwordLogin)
        {
            SearchResultCollection results;
            DirectorySearcher ds = null;
            DirectoryEntry de = new DirectoryEntry(GetCurrentDomainPath("", userNameLogin, passwordLogin));

            // Build User Searcher
            ds = BuildUserSearcher(de);

            ds.Filter = "(&(objectCategory=User)(objectClass=person)(name=" + userName + "*))";

            results = ds.FindAll();

            foreach (SearchResult sr in results)
            {
                Console.WriteLine(sr.Properties["name"] + "");
                Console.WriteLine(sr.Properties["mail"] + "");
                Console.WriteLine(sr.Properties["givenname"] + "");
                Console.WriteLine(sr.Properties["sn"] + "");
                Console.WriteLine(sr.Properties["userPrincipalName"] + "");
                Console.WriteLine(sr.Properties["distinguishedName"] + "");
            }
        }

        public static void GetAUser(string userName, string userNameLogin, string passwordLogin)
        {
            DirectorySearcher ds = null;
            DirectoryEntry de = new
              DirectoryEntry(GetCurrentDomainPath("", userNameLogin, passwordLogin));
            SearchResult sr;

            // Build User Searcher
            ds = BuildUserSearcher(de);
            // Set the filter to look for a specific user
            ds.Filter = "(&(objectCategory=User)(objectClass=person)(name=" + userName + ")";

            sr = ds.FindOne();

            if (sr != null)
            {
                Console.WriteLine(sr.Properties["name"] + "");
                Console.WriteLine(sr.Properties["mail"] + "");
                Console.WriteLine(sr.Properties["givenname"] + "");
                Console.WriteLine(sr.Properties["sn"] + "");
                Console.WriteLine(sr.Properties["userPrincipalName"] + "");
                Console.WriteLine(sr.Properties["distinguishedName"] + "");
            }
        }

        public static void GetAllUsers(string userNameLogin, string passwordLogin)
        {
            SearchResultCollection results;
            DirectorySearcher ds = null;
            DirectoryEntry de = new DirectoryEntry(GetCurrentDomainPath("", userNameLogin, passwordLogin));

            ds = new DirectorySearcher(de);
            ds.Filter = "(&(objectCategory=User)(objectClass=person))";

            results = ds.FindAll();

            foreach (SearchResult sr in results)
            {
                // Using the index zero (0) is required!
                Console.WriteLine(sr.Properties["name"][0].ToString());
            }
        }

        public static void GetAllGroups(string userNameLogin, string passwordLogin)
        {
            SearchResultCollection results;
            DirectorySearcher ds = null;
            DirectoryEntry de = new DirectoryEntry(GetCurrentDomainPath("", userNameLogin, passwordLogin));

            ds = new DirectorySearcher(de);
            // Sort by name
            ds.Sort = new SortOption("name", SortDirection.Ascending);
            ds.PropertiesToLoad.Add("name");
            ds.PropertiesToLoad.Add("memberof");
            ds.PropertiesToLoad.Add("member");

            ds.Filter = "(&(objectCategory=Group))";

            results = ds.FindAll();

            foreach (SearchResult sr in results)
            {
                if (sr.Properties["name"].Count > 0)
                    Console.WriteLine(sr.Properties["name"][0].ToString());

                if (sr.Properties["memberof"].Count > 0)
                {
                    Console.WriteLine(" Member of...");
                    foreach (string item in sr.Properties["memberof"])
                    {
                        Console.WriteLine(" " + item);
                    }
                }
                if (sr.Properties["member"].Count > 0)
                {
                    Console.WriteLine(" Members");
                    foreach (string item in sr.Properties["member"])
                    {
                        Console.WriteLine(" " + item);
                    }
                }
            }
        }


    }
}