﻿namespace Pezza.Core.Contracts;

using System.Collections.Generic;
using System.Threading.Tasks;
using Pezza.Common.DTO;

public interface IStockCore
{
    Task<StockDTO> GetAsync(int id);

    Task<IEnumerable<StockDTO>> GetAllAsync();

    Task<StockDTO> UpdateAsync(StockDTO stock);

    Task<StockDTO> SaveAsync(StockDTO stock);

    Task<bool> DeleteAsync(int id);
}