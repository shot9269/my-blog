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
        console.log(item)
        const detail = document.getElementById("blog-detail")
        detail.innerHTML = `
        <div class="blogItem" data-id=${item.id}>
          <p>${item.content.body}</p>
        </div>`;
      }
    });
  });
}
window.addEventListener("load",blog)