# GiTClientRest
Framework para cliente REST

## Getting Started

Clona o descarga el proyecto para tener una copia en tu maquina.

### Prerequisites

Los requisitos para el framework son:
```
- iOS 9.0 +
- XCode 8.3.3
- Swift 3.0, 3.1, 3.2
```
### Installing

Una vez descargado o clonado arrastre a su proyecto el paquete RestClient.framework y copie si es necesario, asegurece que el framework se agrego correctamente en "Embedded Binaries" y "Linked Frameworks and Libraries".

### Usage

Para usarse lo primero que se debe hacer es:

```swift
import RestClient
```

Una vez importado se manda a llamar:

Llamada normal:
```swift
APICall.request(url: "https://httpbin.org/get") { (json, success, error) in
            //My code
        }
```

Llamada completa:
```swift
APICall.request(method: .post, url: "https://httpbin.org/post", params: ["key" : "object" as AnyObject], headers: ["key" : "object"]) { (json, success, error) in
            //My code
        }
```

Metodos soportados:
```swift
.get
.post
.update
.delete
```

## Versioning

Nosotros usamos versionamiento semantico para el proyecto, para mas información visitar: https://es.wikipedia.org/wiki/Control_de_versiones

## Authors

* **Arturo López Arce** [@Hitilien](https://github.com/Hitilien)
* **Francisco Garcia Galvan** [@yavier](https://github.com/yavier)
* **Alejandro Vargas Chavez** [@aletz](https://github.com/aletz)

## License

Copyright (c) 2017 [@Hitilien](https://github.com/Hitilien), [@yavier](https://github.com/yavier) and [@aletz](https://github.com/aletz)

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:
The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
