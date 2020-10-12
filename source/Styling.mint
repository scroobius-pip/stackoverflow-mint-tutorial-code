component MultipleStylingAndStyleArguments {
  style colorText (color : String) {
    color: #{color};
    display: block;
  }

  style fontSize {
    font-size: 54px;
  }

  style large {
    font-size: 54px;
  }

  style redBackground {
    background-color: red;
  }

  style container {
    justify-content: center;
    align-items: center;
    display: flex;
    flex-direction: column;
    height: 100vh;
    width: 100vw;
  }

  fun render : Html {
    <div::redBackground::container>
      <p::large::colorText("white")>"White"</p>
      <p::large::colorText("blue")>"Blue"</p>
    </div>
  }
}

component ConditionalStyles {
  style fontSize (size : FontSize) {
    case (size) {
      FontSize::Large => font-size: 54px;
      FontSize::Medium => font-size: 32px;
      FontSize::Small => font-size: 24px;
    }
  }

  style redBackground {
    background-color: red;
  }

  style colorText (color : String) {
    color: #{color};
    display: block;
  }

  style container {
    justify-content: center;
    align-items: center;
    display: flex;
    flex-direction: column;
    height: 100vh;
    width: 100vw;
  }

  fun render : Html {
    <div::redBackground::container>
      <p::fontSize(FontSize::Large)::colorText("white")>"Large"</p>
      <p::fontSize(FontSize::Medium)::colorText("white")>"Medium"</p>
      <p::fontSize(FontSize::Small)::colorText("white")>"Small"</p>
    </div>
  }
}

component NestedStyles {
  style body {
    background-color: pink;
    height: 100vh;
    width: 100vw;

    display: flex;

    align-items: center;

    p {
      color: blue;
      font-size: 32px;
      max-width: 50vw;
      margin: auto;
    }
  }

  fun render : Html {
    <div::body>
      <p>"
        Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. 
        "</p>
    </div>
  }
}

enum FontSize {
  Large
  Medium
  Small
}

/*
 component Text {

}
*/
