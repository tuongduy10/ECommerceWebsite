using System;
using System.Collections.Generic;
using System.Globalization;
using System.Linq;
using System.Text;
using System.Text.RegularExpressions;

namespace ECommerce.Utilities.Helpers
{
    public class StringHelper
    {
        public static string GenerateUsername(string fullName)
        {
            // Remove diacritics, replace spaces with underscores, and convert to lowercase
            string username = RemoveDiacritics(fullName).Replace(' ', '_').ToLowerInvariant();
            // Remove non-alphanumeric characters and underscores
            username = Regex.Replace(username, @"[^a-z0-9_]", "");
            return username;
        }
        private static string RemoveDiacritics(string text)
        {
            return string.Concat(text.Normalize(NormalizationForm.FormD)
                                  .Where(ch => CharUnicodeInfo.GetUnicodeCategory(ch) != UnicodeCategory.NonSpacingMark));
        }
    }
}
