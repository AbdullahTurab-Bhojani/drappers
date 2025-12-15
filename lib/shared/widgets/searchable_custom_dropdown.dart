part of '../../drappers.dart';

class SearchableCustomDropdown<T> extends ConsumerStatefulWidget {
  const SearchableCustomDropdown({
    super.key,
    required this.dynamicValues,
    this.onChanged,
    this.value,
    this.validator,
    this.errorMessage,
    this.builder,
    this.label,
    this.hint,
    this.hintStyle,
    this.errorStyle,
    required this.hintText,
    this.filledColor,
    this.onSaved,
    this.borderColor,
    this.searchHint = 'Search...',
    this.maxHeight = 300,
    this.itemHeight = 48,
    this.isSearchable = true,
  });

  final void Function(T?)? onChanged;
  final void Function(T?)? onSaved;
  final String? Function(T?)? validator;
  final String Function(T)? builder;
  final List<T> dynamicValues;
  final String? errorMessage;
  final String? hint;
  final String? label;
  final T? value;
  final Color? filledColor;
  final String hintText;
  final TextStyle? hintStyle;
  final TextStyle? errorStyle;
  final Color? borderColor;
  final String searchHint;
  final double maxHeight;
  final double itemHeight;
  final bool isSearchable;

  @override
  ConsumerState<SearchableCustomDropdown<T>> createState() =>
      _SearchableCustomDropdownState<T>();
}

class _SearchableCustomDropdownState<T>
    extends ConsumerState<SearchableCustomDropdown<T>> {
  T? _value;
  bool _isOpen = false;
  final TextEditingController _searchController = TextEditingController();
  final FocusNode _searchFocusNode = FocusNode();
  final LayerLink _layerLink = LayerLink();
  OverlayEntry? _overlayEntry;
  List<T> _filteredValues = [];

  OutlineInputBorder get border => OutlineInputBorder(
    borderSide: BorderSide(color: widget.borderColor ?? AppColors.borderColor),
    borderRadius: BorderRadius.circular(8),
  );

  @override
  void initState() {
    super.initState();
    _value = widget.value;
    _filteredValues = List.from(widget.dynamicValues);
    _searchController.addListener(_onSearchChanged);
  }

  @override
  void didUpdateWidget(covariant SearchableCustomDropdown<T> oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.value != oldWidget.value) {
      _value = widget.value;
    }
    if (widget.dynamicValues != oldWidget.dynamicValues) {
      _filteredValues = List.from(widget.dynamicValues);
      _onSearchChanged();
    }
  }

  @override
  void dispose() {
    _searchController.dispose();
    _searchFocusNode.dispose();
    _removeOverlay();
    super.dispose();
  }

  void _onSearchChanged() {
    if (!widget.isSearchable) {
      setState(() {
        _filteredValues = List.from(widget.dynamicValues);
      });
      return;
    }

    final query = _searchController.text.toLowerCase();
    setState(() {
      _filteredValues = widget.dynamicValues.where((item) {
        final itemText = widget.builder != null
            ? widget.builder!(item).toLowerCase()
            : item.toString().toLowerCase();
        return itemText.contains(query);
      }).toList();
    });
  }

  void _toggleDropdown() {
    if (_isOpen) {
      _closeDropdown();
    } else {
      _openDropdown();
    }
  }

  void _openDropdown() {
    setState(() {
      _isOpen = true;
    });
    _overlayEntry = _createOverlayEntry();
    Overlay.of(context).insert(_overlayEntry!);
    if (widget.isSearchable) {
      _searchFocusNode.requestFocus();
    }
  }

  void _closeDropdown() {
    setState(() {
      _isOpen = false;
    });
    _searchController.clear();
    _onSearchChanged();
    _removeOverlay();
    _searchFocusNode.unfocus();
  }

  void _removeOverlay() {
    _overlayEntry?.remove();
    _overlayEntry = null;
  }

  void _selectItem(T item) {
    setState(() {
      _value = item;
    });
    widget.onChanged?.call(item);
    _closeDropdown();
  }

  OverlayEntry _createOverlayEntry() {
    return OverlayEntry(
      builder: (context) => Positioned(
        width: _getDropdownWidth(),
        child: CompositedTransformFollower(
          link: _layerLink,
          showWhenUnlinked: false,
          offset: const Offset(0, 48),
          child: Material(
            elevation: 8,
            borderRadius: BorderRadius.circular(8),
            child: Container(
              constraints: BoxConstraints(maxHeight: widget.maxHeight),
              decoration: BoxDecoration(
                color: AppColors.white,
                borderRadius: BorderRadius.circular(8),
                border: Border.all(
                  color: widget.borderColor ?? AppColors.borderColor,
                ),
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  // Search field (only show if searchable)
                  if (widget.isSearchable) ...[
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextField(
                        controller: _searchController,
                        focusNode: _searchFocusNode,
                        style: TextStyle(
                          fontFamily: 'SF-Pro-Text',
                          color: AppColors.darkText,
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                        ),
                        decoration: InputDecoration(
                          hintText: widget.searchHint,
                          hintStyle: TextStyle(
                            fontFamily: 'SF-Pro-Text',
                            fontWeight: FontWeight.w400,
                            fontSize: 16,
                            color: AppColors.lightText,
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(6),
                            borderSide: BorderSide(
                              color: AppColors.borderColor,
                            ),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(6),
                            borderSide: BorderSide(color: AppColors.primary),
                          ),
                          contentPadding: const EdgeInsets.symmetric(
                            horizontal: 12,
                            vertical: 8,
                          ),
                          isDense: true,
                          prefixIcon: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Icon(
                              Icons.search,
                              size: 20,
                              color: AppColors.lightText,
                            ),
                          ),
                        ),
                      ),
                    ),
                    // Divider
                    const Divider(height: 1),
                  ],
                  // Options list
                  Flexible(
                    child: _filteredValues.isEmpty
                        ? Container(
                            padding: const EdgeInsets.all(16),
                            child: PlusJakartaText(
                              'No results found',
                              color: AppColors.lightText,
                              size: 14,
                            ),
                          )
                        : ListView.builder(
                            shrinkWrap: true,
                            itemCount: _filteredValues.length,
                            itemBuilder: (context, index) {
                              final item = _filteredValues[index];
                              final isSelected = _value == item;

                              return GestureDetector(
                                behavior: HitTestBehavior.opaque,

                                onTap: () => _selectItem(item),
                                child: Container(
                                  height: widget.itemHeight,
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 16,
                                    vertical: 12,
                                  ),
                                  decoration: BoxDecoration(
                                    color: isSelected
                                        ? AppColors.primary
                                        : Colors.transparent,
                                  ),
                                  child: Align(
                                    alignment: Alignment.centerLeft,
                                    child: Row(
                                      children: [
                                        Expanded(
                                          child: PlusJakartaText(
                                            widget.builder != null
                                                ? widget.builder!(item)
                                                : item.toString(),
                                            color: isSelected
                                                ? AppColors.primary
                                                : AppColors.darkText,
                                            fontWeight: isSelected
                                                ? FontWeight.w600
                                                : FontWeight.w400,
                                            size: 16,
                                          ),
                                        ),
                                        if (isSelected)
                                          Icon(
                                            Icons.check,
                                            size: 20,
                                            color: AppColors.primary,
                                          ),
                                      ],
                                    ),
                                  ),
                                ),
                              );
                            },
                          ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  double _getDropdownWidth() {
    final RenderBox? renderBox = context.findRenderObject() as RenderBox?;
    return renderBox?.size.width ?? 200;
  }

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.ltr,
      child: CompositedTransformTarget(
        link: _layerLink,
        child: Container(
          decoration: BoxDecoration(
            color: widget.filledColor ?? AppColors.colorFAFAFC,
            borderRadius: BorderRadius.circular(8),
            border: Border.all(
              color: widget.borderColor ?? AppColors.borderColor,
            ),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              // Main input field
              TextFormField(
                onTap: () {
                  _toggleDropdown();
                },
                readOnly: true,
                controller: TextEditingController(
                  text: _value != null
                      ? (widget.builder != null
                            ? widget.builder!(_value as T)
                            : _value.toString())
                      : '',
                ),
                validator: (value) {
                  if (widget.validator != null) {
                    return widget.validator!(_value);
                  }
                  return null;
                },
                onSaved: (value) {
                  if (widget.onSaved != null) {
                    widget.onSaved!(_value);
                  }
                },
                style: TextStyle(
                  fontFamily: 'SF-Pro-Text',
                  color: AppColors.darkText,
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                ),
                decoration: InputDecoration(
                  errorStyle: widget.errorStyle,
                  hintText: widget.hintText,
                  hintStyle:
                      widget.hintStyle ??
                      TextStyle(
                        fontFamily: 'SF-Pro-Text',
                        fontWeight: FontWeight.w400,
                        fontSize: 16,
                        color: AppColors.lightText,
                      ),
                  filled: true,
                  fillColor: Colors.transparent,
                  errorBorder: border,
                  border: InputBorder.none,
                  focusedBorder: InputBorder.none,
                  enabledBorder: InputBorder.none,
                  isDense: true,
                  suffixIcon: Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 14,
                      vertical: 12,
                    ),
                    child: AnimatedRotation(
                      turns: _isOpen ? 0.5 : 0,
                      duration: const Duration(milliseconds: 200),
                      child: Assets.icons.arrowDown.image(
                        fit: BoxFit.cover,
                        scale: 4,
                        height: 20,
                        width: 20,
                      ),
                    ),
                  ),
                  contentPadding: const EdgeInsets.symmetric(
                    horizontal: 14,
                    vertical: 12,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
