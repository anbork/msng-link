<generator>
  <div show={step == 1}>
    <yield />
  </div>
  <div class="messenger-container mt-4" show={step == 2}>
    <div class="form-group" each={messenger in checkedMessengers}>
        <label for={translations[messenger]["short"]}>{translations[messenger]["label"]}</label>
        <div class="form-row">
            <div class="col">
                <input type={translations[messenger]["inputType"]} name={translations[messenger]["short"]} class="form-control" placeholder={translations[messenger]["placeholder"]} onchange={changeHandle} />
            </div>
        </div>       
        <small class="form-text text-muted">{translations[messenger]["small"]}</small> 
    </div>    
    <div class="text-center pt-3">
      <button class="btn btn-primary" onclick={goToStep3withValidate}>{translations['done']}</button>
      <div class="my-2"></div>
      <button class="btn btn-default" onclick={goToStep1}>{translations['back']}</button>
    </div>  
  </div>
  <div class="messenger-container mt-4" show={step == 3}>
    <div class="text-center">
        <h4>{translations['here_is_your_link']}</h4>
    </div>    
    <div class="form-row mt-2 mb-2">
      <div class="col">
        <input value={generatedLink} class="form-control" id="generatedLink" />
      </div>
      <div class="col-auto">
        <button class="btn btn-primary" data-clipboard-target="#generatedLink" id="btn-copy">
          <svg width="20" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 448 512"><path fill="#fff" d="M320 448v40c0 13.255-10.745 24-24 24H24c-13.255 0-24-10.745-24-24V120c0-13.255 10.745-24 24-24h72v296c0 30.879 25.121 56 56 56h168zm0-344V0H152c-13.255 0-24 10.745-24 24v368c0 13.255 10.745 24 24 24h272c13.255 0 24-10.745 24-24V128H344c-13.2 0-24-10.8-24-24zm120.971-31.029L375.029 7.029A24 24 0 0 0 358.059 0H352v96h96v-6.059a24 24 0 0 0-7.029-16.97z"></path></svg>
        </button>
      </div>
    </div>
    <div class="text-center mt-4">
        <p><a href={home_link + "/contacts/"}>{translations['write_me']}</a></p>
    </div>  
    <div class="text-center pt-3">
      <div class="my-1"></div>
      <button class="btn btn-default" onclick={goToStep2}>{translations['back']}</button>
    </div>
  </div>

  <script>
    this.translations = window.translations;
    this.home_link = this.translations.home_link == "/" ? "" : this.translations.home_link
    this.step = 1;
    //debugger;
    var clipboard = new ClipboardJS('#btn-copy');

    clipboard.on('success', function(e) {
        document.getElementById('btn-copy').className = "btn btn-success";
    });

    this.goToStep1 = (e) => {
      this.step = 1; 
    }
    this.goToStep2 = (e) => {
      this.step = 2; 
    }

    this.generatedLink = "";
    this.goToStep3withValidate = (e) => {
      if (this.checkedMessengers.length > Object.keys(this.shorts).length) {
        alert(this.translations['fill_all_fields']);
      } else {
        var parameters = {}
        Object.keys(this.shorts).forEach((key) => {
          var value = this.shorts[key];
          parameters[value] = (parameters[value] || "") + key;
        });
        var array = [];
        Object.keys(parameters).forEach((key) => {
          var value = parameters[key];
          array.push(key + "=" + value);
        });
        this.generatedLink = window.location.origin + "/o?" + array.join("&");
        this.step = 3; 
      }
    }

    this.checkedMessengers = [];
    this.checkMessenger = (e) => {
      this.showNext = false;
      if (e.target.checked) {
        this.checkedMessengers.push(e.target.value);
      } else {
        var index = this.checkedMessengers.indexOf(e.target.value);
        if (index > -1) {
          this.checkedMessengers.splice(index, 1);
        }
      }
      console.log(this.checkedMessengers);
    }
    
    this.shorts = {};
    this.changeHandle = (event) => {
      this.shorts[event.target.name] = event.target.value
      if (!event.target.value || event.target.value.length == 0) {
        delete this.shorts[event.target.name];
      }
    }


  </script>
</generator>