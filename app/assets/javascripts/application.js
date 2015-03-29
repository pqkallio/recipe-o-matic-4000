function addIngredient() {
    counter++;

    var row = document.createElement("TR");
    var ingredientTd = document.createElement("TD");
    var amountTd = document.createElement("TD");
    var unitTd = document.createElement("TD");
    var ing = document.createElement("INPUT");
    var amo = document.createElement("INPUT");
    var uni = document.createElement("INPUT");
    ing.type = "text";
    amo.type = "text";
    uni.type = "text";
    ing.name = "recipe[ingredients][i" + counter + "][material]";
    amo.name = "recipe[ingredients][i" + counter + "][amount]";
    uni.name = "recipe[ingredients][i" + counter + "][unit]";
    ing.id = "recipe_ingredients_i" + counter + "_material";
    amo.id = "recipe_ingredients_i" + counter + "_material";
    uni.id = "recipe_ingredients_i" + counter + "_material";

    ingredientTd.appendChild(ing);
    amountTd.appendChild(amo);
    unitTd.appendChild(uni);
    row.appendChild(ingredientTd);
    row.appendChild(amountTd);
    row.appendChild(unitTd);

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
        var newAmount = ingredientAmount / portions * (portions + amount);
        ingredientAmounts[i].innerHTML = newAmount;
    }
}
