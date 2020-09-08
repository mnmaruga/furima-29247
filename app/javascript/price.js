function calc () {
  const price = document.getElementById("item-price");
  price.addEventListener('input', (e) => {
    let tax = document.getElementById("add-tax-price");
    let sum1 = price.value / 10;
    tax.innerHTML = Math.round(sum1);
    let profit = document.getElementById("profit");
    let sum2 = price.value - Math.round(sum1)
    profit.innerHTML = sum2
    e.preventDefault();
  });
}
window.addEventListener("load", calc);