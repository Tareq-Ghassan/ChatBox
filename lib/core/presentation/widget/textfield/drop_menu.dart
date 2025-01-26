part of 'text_field.dart';

/// [DropMenu] a dropMenu for Country code
class DropMenu extends StatelessWidget {
  ///[DropMenu] constructor
  const DropMenu({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return DropdownMenu<String>(
      inputDecorationTheme: const InputDecorationTheme(
        border: InputBorder.none,
        errorBorder: InputBorder.none,
        enabledBorder: InputBorder.none,
      ),
      initialSelection: BlocProvider.of<ConfigrationBloc>(context)
          .state
          .props
          .first
          .countryCodes!
          .codes![0],
      onSelected: (String? value) {
        if (value != null) {
          context.read<CountryCodeCubit>().countryCode = value;
        } else {
          context.read<CountryCodeCubit>().countryCode = '';
        }
      },
      dropdownMenuEntries: BlocProvider.of<ConfigrationBloc>(context)
          .state
          .props
          .first
          .countryCodes!
          .codes!
          .map<DropdownMenuEntry<String>>((String value) {
        return DropdownMenuEntry<String>(
          value: value,
          label: value,
        );
      }).toList(),
    );
  }
}
