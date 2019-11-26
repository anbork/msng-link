<messenger>
  <yield />
  <div class="form-group">
    <div if={messenger.openLink} class="mt-2">
      <strong class="form-text">{messenger.result}</strong>
      <div class="form-row mt-2 mb-2">
        <div class="col">
          <input value={messenger.openLink} class="form-control" id="messenger_value" />
        </div>
        <div class="col-auto">
          <button class="btn btn-primary" data-clipboard-target="#messenger_value" id="btn-copy">
            <svg width="20" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 448 512"><path fill="#fff" d="M320 448v40c0 13.255-10.745 24-24 24H24c-13.255 0-24-10.745-24-24V120c0-13.255 10.745-24 24-24h72v296c0 30.879 25.121 56 56 56h168zm0-344V0H152c-13.255 0-24 10.745-24 24v368c0 13.255 10.745 24 24 24h272c13.255 0 24-10.745 24-24V128H344c-13.2 0-24-10.8-24-24zm120.971-31.029L375.029 7.029A24 24 0 0 0 358.059 0H352v96h96v-6.059a24 24 0 0 0-7.029-16.97z"></path></svg>
          </button>
        </div>
      </div>
      <small class="form-text">{messenger.html_code}</small>
      <textarea class="form-control mt-1" style="font-size: 13px;" rows="2">{messenger.htmlLink}</textarea>
    </div>
  </div>

  <script>
    this.messenger = window.translations;
    this.messenger.type = this.opts.type;
    var clipboard = new ClipboardJS('#btn-copy');

    clipboard.on('success', function(e) {
        document.getElementById('btn-copy').className = "btn btn-success";
    });

    this.changeHandle = (event) => {
      this.messenger.value = event.target.value
      if (this.messenger.value) {
        this.messenger.openLink = this.messenger.baseLink + "/" + this.messenger.short + "/" + this.messenger.value;
      }
      this.messenger.htmlLink = `<a href="${this.messenger.openLink}">${this.messenger.imageLink}</a>`      
    }
  </script>
</messenger>