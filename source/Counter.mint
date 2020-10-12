component Counter {
  state count : Number = 0

  style container {
    justify-content: center;
    align-items: center;
    display: flex;
    flex-direction: column;
    height: 100vh;
    width: 100vw;

    case (countLevel) {
      Level::Low => background-color: pink;
      Level::Medium => background-color: orange;
      Level::High => background-color: #72e0d1;
    }

    transition: background-color 0.5s ease;
  }

  fun increment : Promise(Never, Void) {
    next { count = count + 1 }
  }

  fun decrement : Promise(Never, Void) {
    next { count = count - 1 }
  }

  fun numberDisplay : Html {
    <h1>"Count: #{count}"</h1>
  }

  get countLevel {
    if (count < 3) {
      Level::Low
    } else if (count < 10) {
      Level::Medium
    } else {
      Level::High
    }
  }

  fun render : Html {
    <div::container>
      <{ numberDisplay() }>

      <Button onClick={increment}/>

      <Button
        danger={true}
        onClick={decrement}
        title="Decrement"/>
    </div>
  }
}

component Button {
  property onClick : Function(Promise(Never, Void))
  property danger : Bool = false

  property title : String = "Add"

  style button {
    border: none;
    color: white;
    padding: 15px 32px;
    text-align: center;
    text-decoration: none;
    display: inline-block;
    font-size: 16px;
    margin-bottom: 10px;
    background: grey;

    if (danger) {
      background: red;
    }
  }

  fun handleClick {
    onClick()
  }

  fun render : Html {
    <button::button onClick={handleClick}>
      <{ title }>
    </button>
  }
}

enum ButtonColor {
  Primary(String)
  Danger(String)
}

enum Level {
  Low
  Medium
  High
}

/*
component Button {



}
*/
