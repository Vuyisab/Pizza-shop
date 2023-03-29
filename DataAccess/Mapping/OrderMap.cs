﻿namespace Pezza.DataAccess.Mapping;

using Microsoft.EntityFrameworkCore;
using Pezza.Common.Entities;

public class OrderMap : IEntityTypeConfiguration<Order>
{
    public void Configure(Microsoft.EntityFrameworkCore.Metadata.Builders.EntityTypeBuilder<Order> builder)
    {
        // table
        builder.ToTable("Order", "dbo");

        // key
        builder.HasKey(t => t.Id);

        // properties
        builder.Property(t => t.Id)
            .IsRequired()
            .HasColumnName("Id")
            .HasColumnType("int")
            .ValueGeneratedOnAdd();

        builder.Property(t => t.CustomerId)
            .IsRequired()
            .HasColumnName("CustomerId")
            .HasColumnType("int");

        builder.Property(t => t.RestaurantId)
            .IsRequired()
            .HasColumnName("RestaurantId")
            .HasColumnType("int");

        builder.Property(t => t.Amount)
            .IsRequired()
            .HasColumnName("Amount")
            .HasColumnType("decimal(17, 2)");

        builder.Property(t => t.DateCreated)
            .IsRequired()
            .HasColumnName("DateCreated")
            .HasColumnType("datetime")
            .HasDefaultValueSql("(getdate())");

        builder.Property(t => t.Completed)
            .IsRequired()
            .HasColumnName("Completed")
            .HasColumnType("bit")
            .HasDefaultValueSql("(0)");
    }
}