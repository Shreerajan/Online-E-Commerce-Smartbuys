<jsp:include page="header.jsp" />
<div class="container">
<h2>Add Product</h2>

<!-- DISPLAY SERVER ERROR -->
<% if ("invalid".equals(request.getParameter("error"))) { %>
    <div class="alert alert-danger">
        Please fill all fields correctly.
    </div>
<% } %>


<form action="addProduct"
    method="post"
    enctype="multipart/form-data"
    onsubmit="return validateProductForm();">

    <!-- PRODUCT NAME -->
    <div class="mb-3">
        <label class="form-label">Product Name</label>
        <input type="text"
               name="name"
               id="name"
               class="form-control"
               required
               minlength="3"
               maxlength="50">
        <small class="text-danger" id="nameError"></small>
    </div>

    <!-- PRICE -->
    <div class="mb-3">
        <label class="form-label">Price</label>
        <input type="text"
               name="price"
               id="price"
               class="form-control"
               
               required>
        <small class="text-danger" id="priceError"></small>
    </div>

    <!-- DESCRIPTION -->
    <div class="mb-3">
        <label class="form-label">Description</label>
        <textarea name="description"
                  id="description"
                  class="form-control"
                  rows="3"
                  minlength="5"
                  maxlength="200"
                  required></textarea>
        <small class="text-danger" id="descError"></small>
    </div>

    <!-- IMAGE -->
    <div class="mb-3">
        <label class="form-label">Product Image</label>
        <input type="file"
               name="image"
               id="image"
               multiple class="form-control"
               accept="image/*"
               required>
               
               
        <small class="text-danger" id="imageError"></small>

        <img id="imagePreview"
             style="display:none; margin-top:10px; width:150px;"
             class="img-thumbnail">
    </div>

    <button type="submit" class="btn btn-primary">
        Add Product
    </button>
</form>
</div>
<script>
function validateProductForm() {

    let valid = true;

    // Clear errors
    document.querySelectorAll("small").forEach(e => e.innerText = "");

    let name = document.getElementById("name").value.trim();
    let price = document.getElementById("price").value;
    let desc = document.getElementById("description").value.trim();
    let image = document.getElementById("image").files[0];

    // NAME
    if (name.length < 3) {
        document.getElementById("nameError").innerText =
            "Product name must be at least 3 characters";
        valid = false;
    }

    // PRICE
    if (price === "" || price <= 0) {
        document.getElementById("priceError").innerText =
            "Enter a valid price greater than 0";
        valid = false;
    }

    // DESCRIPTION
    if (desc.length < 5) {
        document.getElementById("descError").innerText =
            "Description must be at least 5 characters";
        valid = false;
    }

    // IMAGE
    if (!image) {
        document.getElementById("imageError").innerText =
            "Please select an image";
        valid = false;
    } else if (image.size > 2 * 1024 * 1024) {
        document.getElementById("imageError").innerText =
            "Image must be less than 2MB";
        valid = false;
    }

    return valid;
}

// IMAGE PREVIEW
document.getElementById("image").addEventListener("change", function (e) {
    const preview = document.getElementById("imagePreview");
    preview.src = URL.createObjectURL(e.target.files[0]);
    preview.style.display = "block";
});
</script>


<jsp:include page="footer.jsp" />
