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
