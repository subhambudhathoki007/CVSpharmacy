var updateBtns = document.getElementsByClassName('update-cart')


for(var i=0; i<updateBtns.length; i++){
   updateBtns[i].addEventListener('click',function(){
      var fileId = this.dataset.file
      var action= this.dataset.action
      console.log ('fileId:',fileId,'action:',action)

      console.log('USER:',user)
      if(user=== 'AnonymousUser'){
          console.log('Not logged in')
      }
      else{
        updateUserOrder(fileId,action)
      }
   })
}

function updateUserOrder(fileId,action){
     console.log('User is logged in,sending data....')

     var url='/guitars/update_item/'

     fetch(url,{
          method:'POST',
          headers:{
              'Content-Type':'application/json',
              'X-CSRFToken':csrftoken,
          },
          body:JSON.stringify({'fileId':fileId,'action':action})

     })

     .then((response)=>{
        return response.json()

     })
     .then((data)=>{
        console.log('data:',data)
        location.reload()

     })




}