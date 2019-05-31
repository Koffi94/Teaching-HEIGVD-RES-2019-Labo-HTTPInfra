# Report Step 4

1. ```javascript
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
   ```

2. ```html
     <!-- Custom script to load animals -->
     <script src="js/animals.js"></script>
   ```

3. 

