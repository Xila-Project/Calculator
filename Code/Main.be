import Graphics
import This
import math

# - Variable declarations
var Window = This.Get_Window()

# - - Number buttons
var Zero_Button = Graphics.Button_Type()
var One_Button = Graphics.Button_Type()
var Two_Button = Graphics.Button_Type()
var Three_Button = Graphics.Button_Type()
var Four_Button = Graphics.Button_Type()
var Five_Button = Graphics.Button_Type()
var Six_Button = Graphics.Button_Type()
var Seven_Button = Graphics.Button_Type()
var Eight_Button = Graphics.Button_Type()
var Nine_Button = Graphics.Button_Type()

# - - Operator buttons
var Modulo_Button = Graphics.Button_Type()
var Plus_Button = Graphics.Button_Type()
var Minus_Button = Graphics.Button_Type()
var Multiply_Button = Graphics.Button_Type()
var Divide_Button = Graphics.Button_Type()
var Equals_Button = Graphics.Button_Type()

var Clear_Button = Graphics.Button_Type()
var Decimal_Button = Graphics.Button_Type()

# - - Row objects
var First_Row = Graphics.Object_Type()
var Second_Row = Graphics.Object_Type()
var Third_Row = Graphics.Object_Type()
var Fourth_Row = Graphics.Object_Type()
var Fifth_Row = Graphics.Object_Type()

# 
var Current_Input = Graphics.Text_Area_Type()
var History_Label = Graphics.Label_Type()
var Squared_Button = Graphics.Button_Type()
var Square_Root_Button = Graphics.Button_Type()
var Pi_Button = Graphics.Button_Type()
var Open_Parenthesis_Button = Graphics.Button_Type()
var Close_Parenthesis_Button = Graphics.Button_Type()
var Software = This.Get_This()
var Label = Graphics.Label_Type()

var Continue = true

def Set_Interface_Button(Parent, Button, Text)
    Button.Create(Parent)
    Button.Set_Flex_Grow(1)
    Button.Set_Height(Graphics.Get_Percentage(100))
    Button.Add_Event(Software, Graphics.Event_Code_Clicked)
    Label.Create(Button)
    Label.Set_Text(Text)
    Label.Set_Alignment(Graphics.Alignment_Center)
    Label.Clear_Pointer()
end

def Set_Interface_Row(Parent, Row)
    Row.Create(Parent)
    Row.Set_Width(Graphics.Get_Percentage(100))
    Row.Set_Flex_Grow(1)
    Row.Set_Style_Pad_All(0, 0)
    Row.Set_Flex_Flow(Graphics.Flex_Flow_Row)
end

def Set_Interface()
    Window.Set_Title("Calculator")

    Window_Body = Window.Get_Body()
    Window_Body.Set_Flex_Flow(Graphics.Flex_Flow_Column)

    # - - - - Display Label
    History_Container = Graphics.Object_Type()
    History_Container.Create(Window_Body)
    History_Container.Set_Height(64)
    History_Container.Set_Width(Graphics.Get_Percentage(100))
    History_Container.Set_Style_Pad_All(0, 0)

    History_Label.Create(History_Container)
    History_Label.Set_Alignment(Graphics.Alignment_Top_Left)
    History_Label.Set_Width(Graphics.Get_Percentage(100))
    History_Label.Set_Text("")

    # - - - - Current Input
    Current_Input.Create(Window_Body)
    Current_Input.Set_Text("15+56x(45+545)")
    Current_Input.Set_Height(40)
    Current_Input.Set_Width(Graphics.Get_Percentage(100))

    # - - First Row
    Set_Interface_Row(Window_Body, First_Row)

    Set_Interface_Button(First_Row, Clear_Button, Graphics.Get_Symbol(Graphics.Symbol_Code_Backspace))  # - - - Clear Button
    Set_Interface_Button(First_Row, Open_Parenthesis_Button, "(")                                       # - - - Open parenthesis Button
    Set_Interface_Button(First_Row, Close_Parenthesis_Button, ")")                                      # - - - Close parenthesis Button
    Set_Interface_Button(First_Row, Modulo_Button, "%")                                                 # - - - Modulo Button
    Set_Interface_Button(First_Row, Pi_Button, "Pi")                                                    # - - - Pi Button

    # - - Second Row
    Set_Interface_Row(Window_Body, Second_Row)

    Set_Interface_Button(Second_Row, Seven_Button, "7")             # - - - Seven Button
    Set_Interface_Button(Second_Row, Eight_Button, "8")             # - - - Eight Button
    Set_Interface_Button(Second_Row, Nine_Button, "9")              # - - - Nine Button
    Set_Interface_Button(Second_Row, Divide_Button, "/")            # - - - Divide Button
    Set_Interface_Button(Second_Row, Square_Root_Button, "Sqrt")    # - - - Square Root Button

    # - - - Third Row
    Set_Interface_Row(Window_Body, Third_Row)

    Set_Interface_Button(Third_Row, Four_Button, "4")       # - - - - Four Button
    Set_Interface_Button(Third_Row, Five_Button, "5")       # - - - - Five Button
    Set_Interface_Button(Third_Row, Six_Button, "6")        # - - - - Six Button
    Set_Interface_Button(Third_Row, Multiply_Button, "x")   # - - - - Multiply Button
    Set_Interface_Button(Third_Row, Squared_Button, "x^2")  # - - - - Squared Button

    # - - Fourth Row
    Set_Interface_Row(Window_Body, Fourth_Row)

    Set_Interface_Button(Fourth_Row, One_Button, "1")   # - - - One Button
    Set_Interface_Button(Fourth_Row, Two_Button, "2")   # - - - Two Button
    Set_Interface_Button(Fourth_Row, Three_Button, "3") # - - - Three Button
    Set_Interface_Button(Fourth_Row, Minus_Button, "-") # - - - Subtract Button
    Set_Interface_Button(Fourth_Row, Plus_Button, "+")  # - - - Add Button

    # - - Fifth Row
    Set_Interface_Row(Window_Body, Fifth_Row)

    Set_Interface_Button(Fifth_Row, Zero_Button, "0")       # - - - Zero Button
    Set_Interface_Button(Fifth_Row, Decimal_Button, ".")    # - - - Decimal Button
    Set_Interface_Button(Fifth_Row, Equals_Button, "=")     # - - - Equals Button

end

def Calculate(Expression)

    Numbers = []
    Operators = []
    Number = ""
    Sub_Expression = ""
    Inside_Parenthesis = false
    
    Expression_Length = size(Expression) - 1

    if Expression_Length <= -1
        return 0
    end

    print("Expression len : " + str(Expression_Length))

    i = -1
    # - Convert Expression to Numbers and Operators
    while i < Expression_Length
        i += 1
        print(str(i) + " / " + str(Expression_Length))
        if Inside_Parenthesis
            if Expression[i] == ")"
                Inside_Parenthesis = false
                print("Sub Expression : " + Sub_Expression)
                Numbers.push(Calculate(Sub_Expression))
                Sub_Expression = ""
                print("Numbers : " + str(Numbers))
                continue
            elif i == Expression_Length
                print("Sub Expression : " + Sub_Expression)
                Numbers.push(Calculate(Sub_Expression))
                Sub_Expression = ""
                print("Numbers : " + str(Numbers))
                continue
            else
                Sub_Expression += Expression[i]
                print("S : " + Sub_Expression)
                continue
            end
        elif (Expression[i] >= "0") && (Expression[i] <= "9")
            Number += Expression[i]
            print("Number : " + Number)
        else
            if Number != ""
                Numbers.push(real(Number))
                Number = ""
                print("Numbers : " + str(Numbers))
            end

            if (i + 1 < Expression_Length)
                if (Expression[i] == "P") && (Expression[i + 1] == "i")
                    Numbers.push(math.pi)
                    print("Numbers : " + str(Numbers))
                    i += 1
                    continue
                end
            end

            if (Expression[i] == "%") || (Expression[i] == "^")
                Operators.push(Expression[i])
                print("Operators : " + str(Operators))
                continue
            end

     
            if (Expression[i] == "(")
                if Inside_Parenthesis
                    Sub_Expression += Expression[i]
                else
                    Inside_Parenthesis = true
                    Sub_Expression = ""
                end
                continue
            end
        

            if (Expression[i] == "+") || (Expression[i] == "-") || (Expression[i] == "x") || (Expression[i] == "/")
                Operators.push(Expression[i])
                print("Operators : " + str(Operators))
                continue               
            end       

        end
    end


    if Number != ""
        Numbers.push(real(Number))
        Number = ""
        print("Numbers : " + str(Numbers))
    end

    i = 0
    # Evaluate special operators
    while i < size(Operators)
        if Operators[i] == "%"
            Numbers[i] = Numbers[i] % Numbers[i + 1]
            Numbers.pop(i + 1)
            Operators.pop(i)
        elif Operators[i] == "^"
            Numbers[i] = math.pow(Numbers[i], Numbers[i + 1])
            Numbers.pop(i + 1)
            Operators.pop(i)
        else
            i += 1
        end
    end

    i = 0
    # Evaluate multiplication and division
    while i < size(Operators)
        if Operators[i] == "x"
            Numbers[i] = Numbers[i] * Numbers[i + 1]
            Numbers.pop(i + 1)
            Operators.pop(i)
        elif Operators[i] == "/"
            Numbers[i] = Numbers[i] / Numbers[i + 1]
            Numbers.pop(i + 1)
            Operators.pop(i)
        else
            i += 1
        end
    end

    # Evaluate addition and subtraction
    while size(Operators) > 0
        if Operators[0] == "+"
            Numbers[0] = Numbers[0] + Numbers[1]
            Numbers.pop(1)
            Operators.pop(0)
        elif Operators[0] == "-"
            Numbers[0] = Numbers[0] - Numbers[1]
            Numbers.pop(1)
            Operators.pop(0)
        end
    end

    print("Result : " + str(Numbers[0]))
    return Numbers[0]


end

def Execute_Instruction(Instruction)
    if Instruction.Get_Sender() == Graphics.Get_Pointer()
        Target = Instruction.Graphics_Get_Target()
        if Target == Clear_Button
            Current_Input.Delete_Character()
        elif Target == Zero_Button
            Current_Input.Add_Text("0")
        elif Target == One_Button
            Current_Input.Add_Text("1")
        elif Target == Two_Button
            Current_Input.Add_Text("2")
        elif Target == Three_Button
            Current_Input.Add_Text("3")
        elif Target == Four_Button
            Current_Input.Add_Text("4")
        elif Target == Five_Button
            Current_Input.Add_Text("5")
        elif Target == Six_Button
            Current_Input.Add_Text("6")
        elif Target == Seven_Button
            Current_Input.Add_Text("7")
        elif Target == Eight_Button
            Current_Input.Add_Text("8")
        elif Target == Nine_Button
            Current_Input.Add_Text("9")
        elif Target == Plus_Button
            Current_Input.Add_Text("+")
        elif Target == Minus_Button
            Current_Input.Add_Text("-")
        elif Target == Multiply_Button
            Current_Input.Add_Text("x")
        elif Target == Divide_Button
            Current_Input.Add_Text("/")
        elif Target == Open_Parenthesis_Button
            Current_Input.Add_Text("(")
        elif Target == Close_Parenthesis_Button
            Current_Input.Add_Text(")")
        elif Target == Decimal_Button
            Current_Input.Add_Text(".")
        elif Target == Square_Root_Button
            Current_Input.Add_Text("sqrt(")
        elif Target == Squared_Button
            Current_Input.Add_Text("^2")
        elif Target == Modulo_Button
            Current_Input.Add_Text("%")
        elif Target == Pi_Button
            Current_Input.Add_Text("Pi")
        elif Target == Equals_Button
            print("Calculating")
            History_Label.Set_Text(History_Label.Get_Text() + Current_Input.Get_Text() + "=" + str(Calculate(Current_Input.Get_Text())) + "\n")
            Current_Input.Set_Text("")
        end

        print("Instruction from Graphics")
    elif Instruction.Get_Sender() == Softwares.Get_Pointer()
        print("Instruction from Softwares")
        if Instruction.Softwares_Get_Code() == Softwares.Event_Code_Close
            print("Closing")
            Continue = false
        end
    end
end

Set_Interface()

while Continue

    while This.Instruction_Available() > 0
        Execute_Instruction(This.Get_Instruction())     
    end

    This.Delay(50)

end
    