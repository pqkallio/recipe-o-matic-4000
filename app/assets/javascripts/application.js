//= require jquery
//= require jquery_ujs

$(document).ready(function() {
    $("#recipe_cooking").keyup(function() {
        var input = $("#recipe_cooking").val();

        if (input.charAt(input.length - 1) == '*') {
            input = input.replace("*", "°");
        }

        $("#recipe_cooking").val(input);
    });
});

function addIngredient() {
    INGREDIENT_COUNTER++;  // declared in recipes/new.html.erb

    var row = document.createElement("TR");
    row.id = "i" + INGREDIENT_COUNTER;

    row.appendChild(ingredientInputTd("text", "material"));
    row.appendChild(amountInputTd());
    row.appendChild(ingredientInputTd("text", "unit"));
    row.appendChild(ingredientTdDeleteButton());

    document.getElementById("ingredients").appendChild(row);
}

function addPhase() {
    INSTRUCTION_PHASE_COUNTER++;    // declared in recipes/new.html.erb

    var row = document.createElement("TR");
    row.id = "instruction_phase_" + INSTRUCTION_PHASE_COUNTER;

    row.appendChild(phaseTd());
    var phaInput = phaseInput("TEXTAREA", null, "content");
    phaInput.style = "width:300px";
    row.appendChild(phaInput);

    document.getElementById("instructions").appendChild(row);
}

function ingredientInputTd(type, identifier) {
    var ingredientTd = document.createElement("TD");
    var ing = ingredientInput("INPUT", type, identifier);
    ingredientTd.appendChild(ing);
    return ingredientTd;
}

function ingredientInput(tag, type, identifier) {
    var ing = document.createElement(tag);
    ing.type = type;
    ing.name = "recipe[ingredients][i" + INGREDIENT_COUNTER + "]["+ identifier + "]";
    ing.id = "recipe_ingredients_i" + INGREDIENT_COUNTER + "_" + identifier;
    return ing;
}

function amountInputTd() {
    var amountTd = document.createElement("TD");
    var amo = ingredientInput("INPUT", "number", "amount");
    amo.min = "0.1";
    amo.max = "1000";
    amo.step = "0.1";
    amountTd.appendChild(amo);
    return amountTd;
}

function phaseTd() {
    var phaseTd = document.createElement("TD");
    var phaIn = phaseInput("INPUT", "number", "phase");
    var phaText = document.createElement("SPAN");
    phaText.textContent = INSTRUCTION_PHASE_COUNTER + ".";

    phaIn.style = "display:none;";
    phaseTd.style = "padding-right: 100px; vertical-align: top;"
    phaIn.value = INSTRUCTION_PHASE_COUNTER;
    phaseTd.appendChild(phaIn);
    phaseTd.appendChild(phaText);

    return phaseTd;
}

function phaseInput(tag, type, identifier) {
    var pha = document.createElement(tag);

    if (type != null) {
        pha.type = type;
    }

    pha.name = "recipe[recipe_instruction_phases][phase" + INSTRUCTION_PHASE_COUNTER + "]["+ identifier + "]";
    pha.id = "recipe_recipe_instruction_phases_phase" + INSTRUCTION_PHASE_COUNTER + "_" + identifier;
    return pha;
}

function ingredientTdDeleteButton() {
    var delTd = document.createElement("TD");
    var del = ingredientInput("BUTTON", "button", "delete");

    del.textContent = "-";
    del.onclick = function() { document.getElementById("ingredients").removeChild(row); };
    del.class = "btn btn-default";
    del.style.borderRadius = "100%";

    delTd.appendChild(del);
    return delTd;
}

function changePortionAmount(amount) {
    var portions = Number(document.getElementById("portions").textContent);
    var basePortions = Number(document.getElementById("base_portions").textContent);

    if (amount !== 0) {
        if (portions + amount <= 1000 && portions + amount > 0) {
            changeIngredientAmounts(basePortions, portions + amount);
            portions += amount;
            document.getElementById("portions").innerHTML = portions;
        }
    }
}

function changeIngredientAmounts(basePortions, currentPortions) {
    var ingredientAmounts = document.getElementsByName("ingredient_amount");

    for (var i = 0; i < ingredientAmounts.length; i++) {
        var baseAmountTag = ingredientAmounts[i].children[0];
        var baseAmount = Number(baseAmountTag.textContent);
        var newAmount = 1.0 * baseAmount / basePortions * currentPortions;
        newAmount = Math.round(newAmount * 100) / 100;
        ingredientAmounts[i].innerHTML = newAmount;
        ingredientAmounts[i].appendChild(baseAmountTag);
    }
}