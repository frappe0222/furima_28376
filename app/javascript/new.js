  window.addEventListener('load', function(){
    // 要素を取得
    const input_price = document.getElementById("price")
    console.log(input_price);

    const total_price = document.getElementById("profit")
    console.log(total_price);

    const tax = document.getElementById("tax")



   input_price.addEventListener('change', function(){
    value = document.getElementById("price").value;
      const date = (value * 0.9)
      total_price.innerHTML = date
      
      const consumption = (value - date)
      tax.innerHTML = consumption
   })
  })