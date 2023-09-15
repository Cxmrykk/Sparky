module Header = {
    @module("react-native-paper")
    @scope("Appbar")

    @react.component
    external make: (
        ~children: React.element=?
    ) => React.element = "Header"
}

module Content = {
    @module("react-native-paper")
    @scope("Appbar")

    @react.component
    external make: (
        ~title: string=?
    ) => React.element = "Content"
}

module Action = {
    @module("react-native-paper")
    @scope("Appbar")

    @react.component
    external make: (
        ~icon: string=?,
        ~onPress: () => ()=?
    ) => React.element = "Action"
}