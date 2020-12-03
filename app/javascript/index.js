function blog(){
  const blogs = document.querySelectorAll(".border");
  blogs.forEach(function(blog){
    blog.addEventListener("click",()=>{
      const blogId = blog.getAttribute("data-id")
      const xhr = new XMLHttpRequest();
      
      xhr.open("GET",`blogs/${blogId}`, true);
      xhr.responseType = "json";
      xhr.send();
      xhr.onload = ()=>{
        const item = xhr.response.blog;
        const detail = document.getElementById("blog-detail")
        detail.innerHTML = `
        <div class="blogItem" data-id=${item.id}>
          ${item.content.body}
        </div>`;
      }
    });
  });
}
window.addEventListener("load",blog)