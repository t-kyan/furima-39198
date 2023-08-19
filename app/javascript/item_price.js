window.addEventListener('load', () => {
  const priceInput = document.getElementById("item-price");
  const addTaxDom = document.getElementById("add-tax-price");
  const profitValue = document.getElementById("profit");

  priceInput.addEventListener("input", () => {
  const inputValue = priceInput.value; 
  const taxValue = inputValue * 0.1; // 手数料計算
  const profit = inputValue * 0.9; // 販売利益計算

  addTaxDom.innerHTML = Math.floor(taxValue).toLocaleString(); // 手数料を整数に変換して表示
  profitValue.innerHTML = Math.floor(profit).toLocaleString(); // 販売利益を整数に変換して表示
  });
});