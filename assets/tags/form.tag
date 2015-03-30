<ui-form>
    <form>
        <children />
    </form>

    this.on('mount', function() {
      console.debug('mounted', this)
      window.form = this
      this.root.querySelector('form').onsubmit = function(evt) {
          evt.preventDefault()
          console.log('submit', this)
      }
    })
</ui-form>


<form-string>
    <label if={opts.label} for="{opts.name}_id">{opts.label}</label>
    <input type="text" name={opts.name} id="{opts.name}_id" />
</form-string>


<form-latlng>
    <div if={auto}>
        <input type="hidden" name={opts.names.split(',')[0]} id="{opts.names.split(',')[0]}_id" value={coordinates[0]} />
        <input type="hidden" name={opts.names.split(',')[1]} id="{opts.names.split(',')[1]}_id" value={coordinates[1]} />
    </div>
    <div if={!auto}>
        <label if={opts.label} for="{opts.names.split(',')[0]}_id">{opts.labels.split(',')[0]}</label>
        <input type="text" name={opts.names.split(',')[0]} id="{opts.names.split(',')[0]}_id" value={coordinates[0]} />
        <label if={opts.label} for="{opts.names.split(',')[1]}_id">{opts.labels.split(',')[1]}</label>
        <input type="text" name={opts.names.split(',')[1]} id="{opts.names.split(',')[1]}_id" value={coordinates[1]} />
    </div>

    this.on('mount', function() {
        this.auto = this.opts.auto
        if(this.auto) this.update()
        this.coordinates = []
        var self = this

        if (this.auto) {
            // browser can't geolocalize
            if (!navigator.geolocation) {
                self.detectable(false)
            }
            // geolocalized, insert coords
            function success(position) {
                var coordinates = [position.coords.latitude,
                                   position.coords.longitude]
                self.localized(coordinates)
                console.log('found!')
            }
            // can geolocalize
            function error() {
                self.localized(false)
                console.log('Not found :(')
            }
            navigator.geolocation.getCurrentPosition(success, error)
        }
    })

    // behave if the detactable status has responded
    localized(coordinates) {
        this.coordinates = coordinates
        this.auto = true
        if(!this.coordinates) {
            this.auto = false
        }
        console.log('refreshing with auto=', this.auto, 'coordinates=', this.coordinates)
        this.update()
    }
</form-latlng>


<form-check>
    <label if={opts.label} for="{opts.name}_id">{opts.label}
        <input type="checkbox" name={opts.name} value={opts.value} id="{opts.name}_id" />
    </label>
    <input if={!opts.label} type="checkbox" name={opts.name} value={opts.value} id="{opts.name}_id" />
</form-check>


<form-rate>
    <label if={opts.label} for="{opts.name}_id">{opts.label}
        <input type="number" name={opts.name} value={opts.value} min={opts.range.split(',')[0]} max={opts.range.split(',')[1]} />
    </label>
    <input if={!opts.label} type="number" name={opts.name} value={opts.value} min={opts.range.split(',')[0]} max={opts.range.split(',')[1]} />
</form-rate>


<form-submit>
    <button type="submit">{opts.label}</button>
</form-submit>


<children>
    var p = this.parent.root
    while (p.firstChild) {
        if (this.root == p.firstChild) return
        this.root.appendChild(p.firstChild)
    }
</children>
