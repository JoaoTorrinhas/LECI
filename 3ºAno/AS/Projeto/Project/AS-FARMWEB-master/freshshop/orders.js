//adicionar as encomendas, que têm os produtos adicionados no carrinho a uma variável encomendas do local Storage

const ordersEl = document.querySelector(".orders"); //select div class rounded p-2 bg-light
const prodEl = document.querySelector(".teste");

function pr(p){
    let c=[];
    for (const element of p) {
        console.log(element.name);
        console.log(prodEl);
        c.push(element.name);
        c.push("\n");
    }
    return c;

}
function renderorders() {

    let orders = JSON.parse(localStorage.getItem("ORDERS")) || [];
    for (var i=0;i<orders.length;i++){
        var o = orders[i];
        var preco=0;
        var teste  = `<sectionvalidate>
        <figure class="cardvalidate">
            

            
    
    <div class="cardvalidate_hero">
    <img class="cardvalidate_img" src="https://i.pinimg.com/originals/8b/6d/b2/8b6db2ff062a4f614b04d0129bf92771.png" />
</div>
<div class="cardvalidate_content">
    <div class="cardvalidate_info">
        <hvalidateanimal class="cardvalidate_raca"><b>Produto</b> </hvalidateanimal>`;
        for (element of o){
            preco+=element.price*element.numberOfUnits;
            teste+= `<hvalidate class="cardvalidate_raca">${element.name
            }</hvalidate>`;
        }
        teste+=`<hvalidate class="cardvalidate_raca"><b>Preço final:</b>${new Intl.NumberFormat('en-IN', { maximumFractionDigits:3}).format(preco)}</hvalidate>
        </div>
    </div>
    <div class="cardvalidate_content2">
        <div class="cardvalidate_info">
        <hvalidateperson class="cardvalidate_raca"><b>Quantidade</b> </hvalidateperson>`;
        for (element of o){

            teste+=` <hvalidate class="cardvalidate_raca te">${element.numberOfUnits}</hvalidate>`;
        }
        
        teste+=`</div>
        </div>
        </figure>
        </sectionvalidate>`;


        ordersEl.innerHTML+=teste;
    }
}

renderorders(); 
                
