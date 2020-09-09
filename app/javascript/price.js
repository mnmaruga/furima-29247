function calc () {
  const price = document.getElementById("item-price");
  price.addEventListener('input', (e) => {
    let tax = document.getElementById("add-tax-price");
    let sum1 = price.value / 10;
    tax.innerHTML = Math.round(sum1).toLocaleString();
    let profit = document.getElementById("profit");
    let sum2 = price.value - Math.round(sum1)
    profit.innerHTML = sum2.toLocaleString()
  });
}
window.addEventListener("load", calc);