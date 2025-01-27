part of 'text_field.dart';

/// [DropMenu] a dropMenu for Country code
class DropMenu extends StatelessWidget {
  ///[DropMenu] constructor
  const DropMenu({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final state =
        BlocProvider.of<InitializeBloc>(context).state as ConfigurationLoaded;
    return DropdownMenu<String>(
      inputDecorationTheme: const InputDecorationTheme(
        border: InputBorder.none,
        errorBorder: InputBorder.none,
        enabledBorder: InputBorder.none,
      ),
      initialSelection: state.props.first.countryCodes.first.code,
      onSelected: (String? value) {
        if (value != null) {
          context.read<CountryCodeCubit>().countryCode = value;
        } else {
          context.read<CountryCodeCubit>().countryCode = '';
        }
      },
      dropdownMenuEntries: state.props.first.countryCodes
          .map<DropdownMenuEntry<String>>((CountryCode value) {
        return DropdownMenuEntry<String>(
          value: value.code,
          label: value.name,
        );
      }).toList(),
    );
  }
}
