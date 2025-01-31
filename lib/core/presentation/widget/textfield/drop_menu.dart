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
    return DropdownMenu<CountryCode>(
      inputDecorationTheme: const InputDecorationTheme(
        border: InputBorder.none,
        errorBorder: InputBorder.none,
        enabledBorder: InputBorder.none,
      ),
      initialSelection: state.props.first.countryCodes.first,
      onSelected: (CountryCode? value) {
        if (value != null) {
          context.read<CountryCodeCubit>().countryCode = value.code;
        } else {
          context.read<CountryCodeCubit>().countryCode = '';
        }
      },
      dropdownMenuEntries: state.props.first.countryCodes
          .map<DropdownMenuEntry<CountryCode>>((CountryCode value) {
        return DropdownMenuEntry<CountryCode>(
          value: value,
          label: value.code,
          leadingIcon: Text(
            value.name,
          ),
        );
      }).toList(),
    );
  }
}
