/**
 * Copyright (c) 2000-present Liferay, Inc. All rights reserved.
 *
 * This library is free software; you can redistribute it and/or modify it under
 * the terms of the GNU Lesser General Public License as published by the Free
 * Software Foundation; either version 2.1 of the License, or (at your option)
 * any later version.
 *
 * This library is distributed in the hope that it will be useful, but WITHOUT
 * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS
 * FOR A PARTICULAR PURPOSE. See the GNU Lesser General Public License for more
 * details.
 */

package com.liferay.apio.architect.wiring.osgi.manager;

import aQute.bnd.annotation.ProviderType;

import com.liferay.apio.architect.identifier.Identifier;
import com.liferay.apio.architect.representor.Representor;

import java.util.Optional;

/**
 * Provides methods to retrieve information provided by the different {@link
 * com.liferay.apio.architect.representor.Representable} instances. This
 * information includes field functions, types, identifier functions, and more.
 *
 * @author Alejandro Hernández
 * @see    com.liferay.apio.architect.representor.Representable
 */
@ProviderType
public interface RepresentableManager {

	/**
	 * Returns the resource name's model class.
	 *
	 * @param  name the resource name
	 * @return the resource name's model class
	 */
	public <T> Optional<Class<T>> getModelClassOptional(String name);

	/**
	 * Returns the name of a collection resource that matches the specified
	 * class name.
	 *
	 * @param  className the collection resource's class name
	 * @return the collection resource's name
	 */
	public Optional<String> getNameOptional(String className);

	/**
	 * Returns the representor of the collection resource's model class, if that
	 * representor exists. Returns {@code Optional#empty()} otherwise.
	 *
	 * @param  modelClass the collection resource's model class
	 * @return the model class's representor, if present; {@code
	 *         Optional#empty()} otherwise
	 */
	public <T, U extends Identifier> Optional<Representor<T, U>>
		getRepresentorOptional(Class<T> modelClass);

}