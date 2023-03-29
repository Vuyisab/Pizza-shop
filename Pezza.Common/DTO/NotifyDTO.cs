﻿namespace Pezza.Common.DTO;

using System;
using Pezza.Common.Models.Base;

public class NotifyDTO : EntityBase
{
    public int? CustomerId { get; set; }

    public string Email { get; set; }

    public bool? Sent { get; set; }

    public int? Retry { get; set; }

    public DateTime? DateSent { get; set; } = DateTime.Now;

    public virtual CustomerDTO Customer { get; set; }
}