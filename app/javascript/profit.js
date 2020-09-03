function profitCalc() {
  const priceCalc = document.getElementById("item-price");
  priceCalc.addEventListener("keydown", function() {
    const price = priceCalc.value;
    const fee = price * 0.1;
    const feeI = Math.round(fee);
    const addTax = document.getElementById("add-tax-price");
    addTax.innerHTML = feeI;

    const profit = price - fee;
    const profitI = Math.round(profit);
    const gain = document.getElementById("profit");
    gain.innerHTML = profitI;
});
}

window.addEventListener("load", profitCalc)