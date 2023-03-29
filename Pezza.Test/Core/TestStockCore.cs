﻿namespace Pezza.Test.Core;

using System.Linq;
using System.Threading.Tasks;
using Bogus;
using NUnit.Framework;
using Pezza.Common.DTO;
using Pezza.Core;
using Pezza.Test.Setup;

[TestFixture]
public class TestStockCore : QueryTestBase
{
    private StockCore handler;

    private StockDTO stock;

    [SetUp]
    public async Task Init()
    {
        this.handler = new StockCore(this.Context, Mapper());
        this.stock = StockTestData.StockDTO;
        this.stock = await this.handler.SaveAsync(this.stock);
    }

    [Test]
    public async Task GetAsync()
    {
        var response = await this.handler.GetAsync(this.stock.Id);
        Assert.IsTrue(response != null);
    }

    [Test]
    public async Task GetAllAsync()
    {
        var response = await this.handler.GetAllAsync();
        Assert.IsTrue(response.Count() == 1);
    }

    [Test]
    public void SaveAsync()
    {
        var outcome = this.stock.Id != 0;
        Assert.IsTrue(outcome);
    }

    [Test]
    public async Task UpdateAsync()
    {
        var originalStock = this.stock;
        this.stock.Name = new Faker().Commerce.Product();
        var response = await this.handler.UpdateAsync(this.stock);
        var outcome = response.Name.Equals(originalStock.Name);

        Assert.IsTrue(outcome);
    }

    [Test]
    public async Task DeleteAsync()
    {
        var response = await this.handler.DeleteAsync(this.stock.Id);
        Assert.IsTrue(response);
    }
}