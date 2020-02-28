     <%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     <!--footer start-->
     <footer class="site-footer">
       <div class="text-center">
         <p>
           &copy; Copyrights <strong>Lee Seungyeon</strong>. All Rights Reserved
         </p>
         <div class="credits">
           Created by Lee Seungyeon,  My semi-project at JHTA on December 17, 2019
         </div>
         <a href="index.html#" class="go-top">
           <i class="fa fa-angle-up"></i>
           </a>
       </div>
     </footer>
     <!--footer end-->
   </section>

   <script src="/semi/resources/admin/lib/bootstrap/js/bootstrap.min.js"></script>
   <script class="include" type="text/javascript" src="/semi/resources/admin/lib/jquery.dcjqaccordion.2.7.js"></script>
   <script src="/semi/resources/admin/lib/jquery.scrollTo.min.js"></script>
   <script src="/semi/resources/admin/lib/jquery.nicescroll.js" type="text/javascript"></script>
   <script src="/semi/resources/admin/lib/jquery.sparkline.js"></script>
   <!--common script for all pages-->
   <script src="/semi/resources/admin/lib/common-scripts.js"></script>
   <script type="text/javascript" src="/semi/resources/admin/lib/gritter/js/jquery.gritter.js"></script>
   <script type="text/javascript" src="/semi/resources/admin/lib/gritter-conf.js"></script>
   <!--script for this page-->
   <script src="/semi/resources/admin/lib/sparkline-chart.js"></script>
   <script src="/semi/resources/admin/lib/zabuto_calendar.js"></script>
  
   <script type="text/javascript">
     $(document).ready(function() {
       var unique_id = $.gritter.add({
         // (string | mandatory) the heading of the notification
         title: '어서오세요 이승연님',
         // (string | mandatory) the text inside the notification
         text: 'Welcome!',
         // (string | optional) the image to display on the left
         image: 'img/ui-sam.jpg',
         // (bool | optional) if you want it to fade out on its own or just sit there
         sticky: false,
         // (int | optional) the time you want it to be alive for before fading out
         time: 3000,
         // (string | optional) the class name you want to apply to that specific message
         class_name: 'my-sticky-class'
       });
       return false;
     });
   </script>

 </body>
</html>