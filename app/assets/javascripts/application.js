function addIngredient() {
    counter++;

    var row = document.createElement("TR");
    var ingredientTd = document.createElement("TD");
    var amountTd = document.createElement("TD");
    var unitTd = document.createElement("TD");
    var delTd = document.createElement("TD");
    var ing = document.createElement("INPUT");
    var amo = document.createElement("INPUT");
    var uni = document.createElement("INPUT");
    var del = document.createElement("BUTTON");
    ing.type = "text";
    amo.type = "number";
    amo.min = "0.1";
    amo.max = "1000";
    amo.step = "0.1";
    uni.type = "text";
    del.type = "button";
    del.textContent = "-";
    ing.name = "recipe[ingredients][i" + counter + "][material]";
    amo.name = "recipe[ingredients][i" + counter + "][amount]";
    uni.name = "recipe[ingredients][i" + counter + "][unit]";
    row.id = "i" + counter;
    ing.id = "recipe_ingredients_i" + counter + "_material";
    amo.id = "recipe_ingredients_i" + counter + "_amount";
    uni.id = "recipe_ingredients_i" + counter + "_unit";
    del.onclick = function() { document.getElementById("ingredients").removeChild(row) };
    del.class = "btn btn-default";
    del.style.borderRadius = "100%";

    ingredientTd.appendChild(ing);
    amountTd.appendChild(amo);
    unitTd.appendChild(uni);
    delTd.appendChild(del);
    row.appendChild(ingredientTd);
    row.appendChild(amountTd);
    row.appendChild(unitTd);
    row.appendChild(delTd);

    document.getElementById("ingredients").appendChild(row);
}

function changePortionAmount(amount) {
    var portions = Number(document.getElementById("portions").textContent);

    if (amount != 0) {
        if (portions + amount <= 1000 && portions + amount > 0) {
            changeIngredientAmounts(portions, amount);
            portions += amount;
            document.getElementById("portions").innerHTML = portions;
        }
    }
}

function changeIngredientAmounts(portions, amount) {
    var ingredientAmounts = document.getElementsByName("ingredient_amount");

    for (var i = 0; i < ingredientAmounts.length; i++) {
        var ingredientAmount = Number(ingredientAmounts[i].textContent);
        var newAmount = 1.0 * ingredientAmount / portions * (portions + amount);
        newAmount = Math.round(newAmount * 100) / 100;
        ingredientAmounts[i].innerHTML = newAmount;
    }
}