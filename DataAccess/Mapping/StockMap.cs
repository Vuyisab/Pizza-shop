﻿namespace Pezza.DataAccess.Mapping;

using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata.Builders;
using Pezza.Common.Entities;

public partial class StockMap : IEntityTypeConfiguration<Stock>
{
    public void Configure(EntityTypeBuilder<Stock> builder)
    {
        builder.ToTable("Stock");

        builder.HasKey(t => t.Id);

        builder.Property(t => t.Id)
            .IsRequired()
            .HasColumnName("Id")
            .HasColumnType("int")
            .ValueGeneratedOnAdd();

        builder.Property(t => t.Name)
            .IsRequired()
            .HasColumnName("Name")
            .HasColumnType("varchar(100)")
            .HasMaxLength(100);

        builder.Property(t => t.UnitOfMeasure)
            .HasColumnName("UnitOfMeasure")
            .HasColumnType("varchar(20)")
            .HasMaxLength(20);

        builder.Property(t => t.ValueOfMeasure)
            .HasColumnName("ValueOfMeasure")
            .HasColumnType("decimal(18, 2)");

        builder.Property(t => t.Quantity)
            .IsRequired()
            .HasColumnName("Quantity")
            .HasColumnType("int");

        builder.Property(t => t.ExpiryDate)
            .HasColumnName("ExpiryDate")
            .HasColumnType("datetime");

        builder.Property(t => t.DateCreated)
            .IsRequired()
            .HasColumnName("DateCreated")
            .HasColumnType("datetime")
            .HasDefaultValueSql("(getdate())");

        builder.Property(t => t.Comment)
            .HasColumnName("Comment")
            .HasColumnType("varchar(1000)")
            .HasMaxLength(1000);
    }
}