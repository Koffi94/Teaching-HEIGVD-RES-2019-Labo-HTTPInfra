$(function() {
   console.log("loading animals");

   function loadAnimals() {
      $.getJSON("/api/animals/", function( animals ) {
	     message = animals[0].name + " comes from " + animals[0].originCountry;
	     $(".text-white-75").text(message);
      });
   };

   loadAnimals();
   setInterval( loadAnimals, 3000 );
});
