package com.ybt.web.converter;

import org.springframework.core.convert.converter.Converter;
import org.springframework.core.convert.converter.ConverterFactory;
import org.springframework.util.Assert;

import com.jiufengxinxi.utils.EnumUtil;

/**
 * Converts from a String to a java.lang.Enum by calling {@link Enum#valueOf(Class, String)}.
 *
 * @author Keith Donald
 * @since 3.0
 */
@SuppressWarnings({ "unchecked", "rawtypes" })
final class StringToEnumConverterFactory implements ConverterFactory<String, Enum> {

	public <T extends Enum> Converter<String, T> getConverter(Class<T> targetType) {
		Class<?> enumType = targetType;
		while(enumType != null && !enumType.isEnum()) {
			enumType = enumType.getSuperclass();
		}
		Assert.notNull(enumType, "The target type " + targetType.getName()
				+ " does not refer to an enum");
		return new StringToEnum(enumType);
	}

	private class StringToEnum<T extends Enum> implements Converter<String, T> {

		private final Class<T> enumType;

		public StringToEnum(Class<T> enumType) {
			this.enumType = enumType;
		}

		public T convert(String source) {
			if (source.length() == 0) {
				// It's an empty enum identifier: reset the enum value to null.
				return null;
			}
			return (T) EnumUtil.getEnumValueOf(this.enumType, source.trim());
			//return (T) Enum.valueOf(this.enumType, source.trim());
		}
	}

}