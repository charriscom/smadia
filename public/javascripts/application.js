// Place your application-specific JavaScript functions and classes here
// This file is automatically included by javascript_include_tag :defaults
jQuery.fn.toggleAttr = function(attr) {
 return this.each(function() {
  var $this = $(this);
  $this.attr(attr) ? $this.removeAttr(attr) : $this.attr(attr, attr);
 });
};

$(function(){
  $(".contact_form").submit(function(evt){
    //evt.preventDefault();
    var $form = $(this);
    var hash = {
      name: $form.find("input[name='form_entry[name]']").val(),
      last_name: $form.find("input[name='form_entry[last_name]']").val(),
      phone: $form.find("input[name='form_entry[phone]']").val(),
      mobile: $form.find("input[name='form_entry[mobile]']").val(),
      country: $form.find("input[name='form_entry[country]']").val(),
      city: $form.find("input[name='form_entry[city]']").val(),
      mail: $form.find("input[name='form_entry[email]']").val(),
      treatment: getTreatmentId($form.find("select[name='form_entry[service]']").find("option:selected").val()),
      source: 13
    };
    var url = "http://crm.smadiaclinic.com/up.php?callback=?";
    $.ajax({
      url: url,
      data: hash,
      dataType: 'jsonp'
    });
  });
})

getTreatmentId = function(service){
  var id = TREATMENTS_ID[service];
  return (id == undefined) ? "" : id;
}

TREATMENTS_ID = {
  "Laserlipolisis": 3,
  "Hidrolipoclasia": 4,
  "Ultracavitación": 10,
  "Carboxiterapia": 11,
  "Drenaje Linfático Manual": 12,
  "Presoterapia": 13,
  "Radiofrecuencia Corporal": 15,
  "Masaje Relajante": 18,
  "Momificación": 19,
  "Peeling": 20,
  "Fotodepilación": 21,
  "Depilación con Cera": 22,
  "Escleroterapia": 25,
  "Intradermoterapia": 26,
  "Sueroterapia": 30,
  "Microdermoabrasion": 6,
  "Radiofrecuencia Facial": 7,
  "Laser RFID": 14,
  "Hidratación": 16,
  "Higiene": 17,
  "Fotodepilación": 23,
  "Depilación con Cera": 24,
  "Intradermoterapia": 27,
  "Tatuaje de Cejas": 28,
  "Plasma": 29,
  "Microdermoinfusión": 41,
  "Softlift": 42,
  "Botox": 43,
  "Abdominoplastia": 9,
  "Abdominoplastia con Liposucción": 32,
  "Liposucción": 33,
  "Mamoplastia de aumento": 34,
  "Mamoplastia de Reducción": 35,
  "Mastopexia (levantamiento de mamas)": 36,
  "Blefaroplastia": 37,
  "Lifting": 38,
  "Otoplastia": 39,
  "Rinoplastia": 40
}