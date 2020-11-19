$(document).ready(function (){
  var myDate = function(x) {
    let month = ["janvier", "fevrier", "mars", "avril", "mai", "juin", "juillet", "août", "septembre", "octobre", "novembre", "décembre"];
    let temp = x.split(/[- :T]/);
    return "le " + temp[2] + " " + month[temp[1]-1] + " " + temp[0];
  }
  const getdate = () => {
    var settings = {
        "url": "/PortesOuvertes/accueil",
        "method": "GET",
        "timeout": 0,
      };
      $.ajax(settings).done(function (response) {
        console.log(response);
        const events1 = $('#dateDynamique');
        response.forEach((item) => {
          events1.append(`<h2 class="w300" style="color: white;">`+myDate(item.startdate)+`</h2>`);
          
      });
      });
  }
  
    const getprogramDescription = () => {
        var settings = {
            "url": "/Program/programDescription",
            "method": "GET",
            "timeout": 0,
          };
          $.ajax(settings).done(function (response) {
            console.log(response);
            const events2 = $('#idProgram');
            response.forEach((item) => {
                events2.append(`<div><input class="curseId" id="curseId" type="checkbox" value="${item.idprogram}"> ${item.programdescription} </input></div>`);
                
            });
          });
    }

    getdate();
    getprogramDescription();

    // SUBMIT FORM
    $("#formulaire").submit(function(event) {
        // Prevent the form from submitting via the browser
        console.log("Submit!!");
        event.preventDefault();
        processData();
    });
});


function processData(){

    const form2 = $("#formulaire");
    const form = document.getElementById("formulaire")
    console.log("FORM: ", form, "TYPE:",typeof(form));
    var data = {};
        data.lastName = form.nom.value;
        data.firstName = form.prenom.value;
        data.phone = form.telephone.value;
        data.mail = form.courriel.value;
        data.country = form.pays.value;
        if (data.country == "Canada") {
          data.state = form.province.value;
        } 
        //data.state = form.province.value;
        // data.curseId = $('.curseId:checked').val();
        data.curseId = checkboxSelectionne();
        // if (autreText.length > 0) {
        //   data.moyenCommunication = autreText;
        //   //data.moyenCommunication = $('.moyenCommunication:checked').val();
        // } else {
        //   data.moyenCommunication = checkboxCommunicationSelectionne();
        // }
        //data.moyenCommunication = $('.moyenCommunication:checked').val();
        data.moyenCommunication = checkboxCommunicationSelectionne();
        data.consentMessage = form.consent.value;
        //console.log(data);
    if (data.curseId == null) {
      console.log("Programme ne peut pas être vide.");
      alert("Veuillez cochez au moins un programme auquel vous seriez intéressé.");
      return null;
    } else if (data.moyenCommunication == null) {
      console.log("Moyen de Communication ne peut pas être vide.");
      alert("Veuillez cochez au moins un moyen de communication à travers lequel vous avez entendu parler des Portes Ouvertes.");
      return null;
    } else {
      submitForm(data);
      document.getElementById("provinceLabel").style.display = "inline";
      document.getElementById("province").style.display = "inline";
      
    }
    

}

function checkboxSelectionne(){
  let valeursCheck = [];
$('.curseId:checked').each(function(){
    valeursCheck.push(this.value);
});
  if (valeursCheck.length == 0) {
    return null;
  } else {
    return valeursCheck;
  }

}

function checkboxCommunicationSelectionne(){
  let valeursCommunicationCheck = [];
  var autreText = document.getElementById('autreText');
$('.moyenCommunication:checked').each(function(){
  valeursCommunicationCheck.push(this.value);
});
if (autreText.value.length > 0) {
  valeursCommunicationCheck.push(autreText.value);
};
valeursCommunicationCheck.toString();
  if (valeursCommunicationCheck.length == 0) {
    return null;
  } else {
    return valeursCommunicationCheck;
  }

}

function submitForm(data){
    console.log('DATA:', data);
    var settings = {
        "url": "/Inscription",
        "method": "POST",
        "timeout": 0,
        "headers": {
          "Content-Type": "application/json"
        },
        "data": JSON.stringify(data)
    };
      
    $.ajax(settings).done(function (response) {
      if (response.success){
          alert("Votre formulaire est envoyé! Vous recevrez par courriel sous peu tous les détails concernant les portes ouvertes et le lien pour rejoindre l'événement. Si vous ne recevez pas de courriel, pensez à vérifier vos courriels indésirables, on ne sait jamais!");
          document.getElementById('formulaire').reset();
      }
      else
          alert("Il y a eu une erreur interne dans le serveur")
      });
}

//////////////////////////////////
function afficherCacher() {
  var autre = document.getElementById("autre");
  var dvtext = document.getElementById("autreText");
  dvtext.style.display = autre.checked ? "inline" : "none";
}

function changeFunc() {
  var selectBox = document.getElementById("selectBox");
  var selectedValue = selectBox.options[selectBox.selectedIndex].value;
  if (selectedValue != "Canada") {
    document.getElementById("provinceLabel").style.display = "none";
    document.getElementById("province").style.display = "none";
  } else {
    document.getElementById("provinceLabel").style.display = "inline";
    document.getElementById("province").style.display = "inline";
  }
 }

