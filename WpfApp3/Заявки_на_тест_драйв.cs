//------------------------------------------------------------------------------
// <auto-generated>
//     Этот код создан по шаблону.
//
//     Изменения, вносимые в этот файл вручную, могут привести к непредвиденной работе приложения.
//     Изменения, вносимые в этот файл вручную, будут перезаписаны при повторном создании кода.
// </auto-generated>
//------------------------------------------------------------------------------

namespace WpfApp3
{
    using System;
    using System.Collections.Generic;
    
    public partial class Заявки_на_тест_драйв
    {
        public int Код_заявки { get; set; }
        public int Код_электромобиля { get; set; }
        public string имя { get; set; }
        public string e_mail { get; set; }
        public string телефон { get; set; }
        public System.DateTime дата_заявки { get; set; }
    
        public virtual Электромобили Электромобили { get; set; }
    }
}
